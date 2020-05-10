

########### 2010 - 2019 Team Stats (Tables) ###########################

# Plotting champions of each year
champs_byseason <- teamhistreg[teamhistreg$`Eventual Champion` ==1,]


#By Season
histreg_byseason = teamhistreg %>% group_by(., Season)

#Average historical value
avgstat_byseason = teamhistreg %>% group_by(., Season) %>% summarise_all(., mean)

#Average of each stat (without 2012-13 season)
avgstat_total = teamhistreg %>% filter(., !Season=='2012-13') %>% summarise_all(., mean)


#By Team
histreg_byteam = teamhistreg %>% group_by(., Tm)





# Shiny function
shinyServer(function(input, output) {
    
    
    historical_avg <- reactive({
        league_average <- avgstat_total %>% select(., input$teamstat)
        
    })
    
    leaguewide_input <-reactive({ 
        histreg_byteam %>% filter(., Season == input$seasonselect) %>% 
            select(., selected =input$teamstat, Season, Tm, MadePlayoffs, Division)
        })
    
#Tab 2: Regular Season Stats
     output$season_graph <- renderPlot({
         
         #Graph 2: Stat metric vs. entire league per season (compared with historical average)
            
            leaguewide_input() %>% ggplot(., aes(x=Tm, y=selected)) + 
             geom_point(aes(color=MadePlayoffs, shape=Division)) + 
             xlab('Team') + ylab(input$teamstat) + 
             geom_hline(yintercept= as.integer(historical_avg())) +
             theme(axis.text.x = element_text(angle = 90)) +
             geom_text(aes(label=Tm),nudge_y = 0.5,size=2)

     })
        
        
        
        
        
# Tab 3: Playoff Stats
        
        
        
        
        
# Tab 4: Create your own team
        
        
        
}) #end of shinyServer

