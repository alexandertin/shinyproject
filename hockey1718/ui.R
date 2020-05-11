


# Shiny Layout
shinyUI(
    dashboardPagePlus(
        header = dashboardHeader(
            title = 'NHL 2017-18 Season Analysis',
            titleWidth = 350
        ),
        #end dashboardHeader
        
        sidebar = dashboardSidebar(
            sidebarUserPanel("Alex Tin BDS021", image = 'https://i.pinimg.com/originals/6c/ce/de/6ccede86e8a11d520f5e7a3386d46ff0.jpg'),
            sidebarMenu(
                menuItem("Introduction",
                         tabName = 'intro',
                         icon = icon('book')),
                menuItem(
                    "Regular Season Stats",
                    tabName = 'regular',
                    icon = icon('fas fa-hockey-puck')
                ),
                menuItem(
                    "Playoffs! On to the cup!",
                    tabName = 'playoffs',
                    icon = icon('fas fa-trophy')
                ),
                menuItem(
                    "Approach & Takeaways",
                    tabName = 'takeaway',
                    icon = icon('fas fa-atlas')
                )
                
            )
            
        ), #end dashboardSidebar
        
        body = dashboardBody(
            tabItems(
                
                #Tab 1: Intro
                tabItem(tabName = 'intro',
                        fluidRow(
                            box(
                                width = 8,
                                h2(strong('Introduction')),
                                h4(
                                p('Ice Hockey is fun to watch, fun to play!'),
                                p('In other professional sports, most notably baseball and basketball, analytics has started/ is playing a major role in how teams are constructed.'),
                                p('The NHL (National Hockey League) is just on the cusp of taking analytics to the next level.'),
                                p('On March 3, 2020, it was announced on NHL.com that the final stage of testing for puck and player tracking was underway, to be rolled out by the time playoffs (were supposed to) come around.'),
                                p('https://www.nhl.com/news/nhl-plans-to-deploy-puck-and-player-tracking-technology-in-2019-2020/c-304218820'),
                                p('This is of course exciting news! It opens many more avenues for analytics and understanding the game better and how to improve.')
                                ),
                                h2(strong('Objectives of this analysis')),
                                h4(
                                p('While this new fountain of data to come with player and puck tracking is yet to be implemented, advanced metrics based on currently tracked and available information has been devised.'),
                                p('The objective of my project is to examine team performance metrics as they are now to understand if there are any indicators for post-season success.'),
                                p('These metrics will be analysed through 5 different aspects of the game:'),
                                p('1) Shot Volume'),
                                p('2) Shot Accuracy'),
                                p('3) Possession of the Puck'),
                                p('4) Goalie Save %'),
                                p('5) Physicality/Grit'),
                                
                                
                                print(img(src='https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Capitals-Maple_Leafs_%2834075134291%29.jpg/1200px-Capitals-Maple_Leafs_%2834075134291%29.jpg',
                                          width='100%')),
                                p('Picture from Wikipedia')
                                )
                                
                                
                            )
                            
                        )
                ),
                #end tab1 tabItem
            
            
                # Tab 2: Regular Season Stats
                tabItem(tabName = 'regular',
                        fluidRow(
                            h2('Regular Season Stats - What does it take to make the playoffs?')
                        ),
                        fluidRow(
                            column(
                                width = 6,
                                selectInput(
                                    inputId = "seasonselect",
                                    label = h4("Season"),
                                    choices = unique(histreg_byteam$Season),
                                    selected = '2018-19'
                                    )
                            )
                        ),
                        fluidRow(
                            column(
                                width = 5,
                                selectInput(
                                    inputId = "teamstat",
                                    label = h4("Stat Category"),
                                    choices = vars,
                                    selected = 'CF%'
                                    )
                            ),
                            column(
                                width = 2,
                                selectInput(
                                    inputId = "teamstat1",
                                    label = h4("Stat Category X"),
                                    choices = vars,
                                    selected = 'FO%'
                                    )
                            ),
                            column(
                                width = 2,
                                selectInput(
                                    inputId = "teamstat2",
                                    label = h4("Stat Category Y"),
                                    choices = vars,
                                    selected = 'CF%'
                                    )
                            )
                        ), 
                        fluidRow(
                            box(
                                width = 5,
                                tabPanel(
                                    title = 'Season Comparison', 
                                    plotOutput('season_graph')
                                )
                            ),
                            box(
                                width = 5,
                                tabPanel(
                                    title = 'Pairwise Stat Comparison',
                                    plotlyOutput('stat_graph')
                                )
                            )
                        ), # end fluidRow
                        fluidRow(
                            boxPlus(
                                title = 'Glossary',
                                closable = FALSE,
                                collapsible = TRUE,
                                enable_dropdown = FALSE,
                                p("1) Shot Volume:"),
                                p("Total shots taken (CF): Metric known as 'Corsi For. It measures all shots taken against the opposition, including goals, misses or blocked shots"),
                                p("Total shots faced (CA): Metric known as 'Corsi Against'. It measures all shots taken by the opposition, including goals, misses or blocked shots"),
                                p(" "),
                                p("2) Shot accuracy/quality:"),
                                p("Shots fired towards net (FF): Metric known as 'Fenwick For'. Similar to Corsi For, but only measures shots that weren't blocked."),
                                p("Goals percentage (ioSH): Measures goal percentage - this is taken as goals/shots taken"),
                                p("  "),
                                p("3) Possession:"),
                                p("Offensive Zone Start Percentage (oZS%): Percentage started in the opponent's half"),
                                p("Defensive Zone Start Percentage (dZS%): Percentage started in their own half"),
                                p(" "),
                                p("4) Face-off Wins:"),
                                p("Face-off Wins (FO%): Wins on the face-off spots/circles."),
                                p(" "),
                                p("5) Save%:"),
                                p("Goalie Saves (oiSV%): Measures the goalie save percentage. Expressed as over 1.000"),
                                p("6) Physicality/Grit"),
                                p("Hits: Hits credited on the opposition"),
                                p("Blocks: Blocked shots - willingness of players to put their body on the line")
                                
                            )
                        ) # end of fluidRow
                        
                    ),    #end tab2 tabItem
                
                
                # Tab 3: Playoff Stats
                  tabItem(tabName = 'playoffs',
                        fluidRow(
                                h2('Playoff Stats - The road to hoist the cup')
                        ),
                        fluidRow(
                                column(
                                    width = 6,
                                    selectInput(
                                        inputId = "seasonselect2",
                                        label = h4("Season"),
                                        choices = unique(playoff_summ$playoff_year),
                                        selected = '2018-19'
                                        )
                                )
                        ),
                        fluidRow(
                                column(
                                    width = 5,
                                    selectInput(
                                        inputId = "teamstat3",
                                        label = h4("Stat Category"),
                                        choices = vars2,
                                        selected = 'avg_age'
                                    )
                                ),
                                column(
                                    width = 2,
                                    selectInput(
                                        inputId = "teamstat4",
                                        label = h4("Stat Category X"),
                                        choices = vars2,
                                        selected = 'shot_pct'
                                    )
                                ),
                                column(
                                    width = 2,
                                    selectInput(
                                        inputId = "teamstat5",
                                        label = h4("Stat Category Y"),
                                        choices = vars2,
                                        selected = 'tot_hits'
                                    )
                                )
                        ),
                        fluidRow(
                                box(
                                    width = 5,
                                    tabPanel(
                                        title = 'Season Comparison',
                                        plotOutput('playoff_graph')
                                        )
                                    ),
                                box(
                                    width = 5,
                                    tabPanel(
                                        title = 'Pairwise Stat Comparison',
                                        plotlyOutput('pstat_graph')
                                        )
                                    )
                        ) # end fluidRow
                # 
                ), #end tab3 tabItem

                #     
                #     # Tab 4: Takeaways
                tabItem(tabName = 'takeaway',
                        fluidRow(
                                box(
                                    h2('Approach'),
                                    h3('Regular Season'),
                                    h4(
                                        p('The approach for the exercise was first to identify the relevant factors which would set a team up for a good post-season.'),
                                        p('From looking at the 6 relevant factors (Shot Volume, Shot accuracy, Possession, Face-off wins, Saves, and Physicality:'),
                                        p('In general, no clear indicators, by ballpark "targets" in order to make the post season. This translates to threshold to keep in mind during the season.'),
                                        p('However, physicality (hits, blocks) and possession (oZS or dZS) were relatively less important'),
                                  
                                    ),
                                    h3('Playoffs'),
                                    h4(
                                        p('It is well known that regular season success does not necessarily translate to post-season success.'),
                                        p('So which factors are most important once reaching the playoffs?'),
                                        p('Another factor I have added for playoffs is the average age of players.'),
                                        p('In the post-season, to no surprise, the difference maker was that champion always had a higher goal conversion rate, even though the volume of shots are usually similar.')
                                    ),
                                    h2('Further work'),
                                    h4(
                                        p('It would be interesting to tie in these team stats with the individual stats of each skater.')
                                    )
                                    
                                )
                        )
                ) #end TabItem


                #     
                    
            )#end TabItems
        ) #end dashboardBody
            
    ) #end dashboardPage
)#end of shinyUI
        