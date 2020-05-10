

########### 2010 - 2019 Team Stats (Tables) ###########################

#By Season
histreg_byseason = teamhistreg %>% group_by(., Season)

#Average historical value
avgstat_byseason = teamhistreg %>% group_by(., Season) %>% summarise_all(., mean)

#Average of each stat (without 2012-13 season)
avgstat_total = teamhistreg %>% filter(., !Season=='2012-13') %>% summarise_all(., mean)


#By Team
histreg_byteam = teamhistreg %>% group_by(., Tm)


absolutevar = c('CF','CA','FF','HIT','BLK')
percentvar = c('oiSH%','oiSV%')
percentvar50 = c('CF%','FO%')


################# 2010-2019 Playoff Stats ###########################


#add identifier as playoff stats ('playoff_'), and convert to lowercase
colnames(team2018playoff) <- paste0('playoff_',tolower(colnames(team2018playoff)))


#add divisions
team2018playoff <- team2018playoff %>% 
    mutate(., division = ifelse(playoff_tm %in% Atlantic,'Atlantic', 
                                ifelse(playoff_tm %in% Metro, 'Metropolitan', 
                                       ifelse(playoff_tm %in% Central, 'Central','Pacific'))))


#Calculate Team Stats normalised per game (CF, CA, and FF) (Player level)
playoff2018total2 <- team2018playoff %>% 
    mutate(.,'goalnorm' = playoff_g/playoff_gp, 
           'shotsnorm' = playoff_cf/playoff_gp, 
           'CFnorm'=playoff_cf/playoff_gp, 
           'CAnorm'=playoff_ca/playoff_gp, 
           'FFnorm'=playoff_ff/playoff_gp, 
           'hitnorm' = playoff_hit/playoff_gp, 
           'blknorm' = playoff_blk/playoff_gp)

#Group_by playoff year, division, season
playoff2018total3 <- playoff2018total2 %>% 
    group_by(., playoff_year, division, playoff_tm) %>% 
    mutate(., tot_gp = max(playoff_gp))

#Create Teeam level stats
playoff2018total3 <- playoff2018total3 %>% 
    summarise(., avg_age = mean(playoff_age), 
              tot_goal = sum(goalnorm), 
              tot_shots = sum(shotsnorm, na.rm = T), 
              tot_blocks = sum(blknorm), 
              tot_hits = sum(hitnorm), 
              totnorm_cf = sum(CFnorm), 
              totnorm_ca = sum(CAnorm), 
              totnorm_ff = sum(FFnorm), 
              shot_pct = mean(`playoff_oish%`, na.rm=T), 
              tot_dzs = mean(`playoff_dzs%`, na.rm = T),
              tot_ozs = mean(`playoff_ozs%`, na.rm = T))

# Add results of playoffs
championsubtable = histreg_byteam %>% select(., Tm, Season, `Eventual Champion`)

playoff_summ <- dplyr::left_join(playoff2018total3,championsubtable, 
                                 by=c('playoff_year'='Season','playoff_tm'='Tm'))


# Playoff average
playoff_avg <- playoff_summ %>% ungroup() %>% summarise_all(., mean, na.rm=T)


#################################### Shiny function

shinyServer(function(input, output) {
    
    
    historical_avg <- reactive({
        league_average <- avgstat_total %>% select(., input$teamstat)
        
    })
    
    leaguewide_input <-reactive({ 
        histreg_byteam %>% filter(., Season == input$seasonselect) %>% 
            select(., selected =input$teamstat, Season, Tm, MadePlayoffs, Division)
    })
    
    
    stat_input <- reactive({
        histreg_byteam %>% filter(., Season == input$seasonselect) %>% 
            select(., SelectedX =input$teamstat1, SelectedY = input$teamstat2, Season, Tm, MadePlayoffs, Division)
        
    })
    
    playoff_avg <- reactive({
        playoff_avg %>% select(., input$teamstat3)
        
    })
    
    
    playoff_input <- reactive({
        playoff_summ %>% filter(., playoff_year == input$seasonselect2) %>% 
            select(., select=input$teamstat3, playoff_year, playoff_tm, `Eventual Champion`, division)
        
    })
    
    playoffstat_input <- reactive({
        playoff_summ %>% filter(., playoff_year == input$seasonselect2) %>% 
            select(., SelectedX = input$teamstat4, SelectedY = input$teamstat5, playoff_year, playoff_tm, `Eventual Champion`, division)
    })
    
    
#Tab 2: Regular Season Stats
     
    
    output$season_graph <- renderPlot({

        #Graph 2: Stat metric vs. entire league per season (compared with historical average)
        # if (input$teamstat %in% absolutevar) {
            leaguewide_input() %>% ggplot(., aes(x = Tm, y = selected)) +
                geom_point(size=5, aes(color = MadePlayoffs, shape = Division)) +
                xlab('Team') + ylab(input$teamstat) +
                geom_hline(yintercept = as.integer(historical_avg())) +
                theme(axis.text.x = element_text(angle = 90)) +
                geom_text(aes(label = selected), nudge_y = 0.5, size = 4) + 
                ggtitle('Stats v. Historical Average') + theme(plot.title= element_text(size=20, hjust=0.5))
        # }
        
        # if (input$teamstat %in% percentvar){
        #     leaguewide_input() %>% 
        #         ggplot(., aes(x=`FO%`, y=`CF%`)) + 
        #         geom_point(aes(color=MadePlayoffs, shape=Division)) + 
        #         theme(axis.text.x = element_text(angle = 90)) + 
        #         geom_vline(xintercept=fifty) + geom_hline(yintercept=fifty) + 
        #         geom_text(aes(label=Tm),nudge_x = 0.4,size=2) 
        #     
        #     
        #     
        #     
        # }
            
            
    })
        
    output$stat_graph <- renderPlotly({
        plot_ly(stat_input(), x=~SelectedX, y = ~SelectedY,
                text = ~paste('Team:',Tm),
                symbol = ~MadePlayoffs, symbols = c('x','o')) %>% 
                layout(title='Stats Comparison', legend=list(title=list(text='<b>Made Playoffs')))
        
    })
        
        
        
# Tab 3: Playoff Stats
        
        
        
        
        
# Tab 4: Create your own team
        
        
        
}) #end of shinyServer

