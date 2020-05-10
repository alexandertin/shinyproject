


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
                # menuItem(
                #     "Create your own team",
                #     tabName = 'create',
                #     icon = icon('fas fa-funnel-dollar')
                # ),
                menuItem(
                    "Glossary",
                    tabName = 'glossary',
                    icon = icon('fas fa-atlas')
                )
                
            )
            
        ), #end dashboardSidebar
        
        body = dashboardBody(
            tabItems(
                
                #Tab 1: Intro
                tabItem(tabName = 'intro',
                        fluidRow('intro')
                ),
                #end tab1 tabItem
            
            
                # Tab 2: Regular Season Stats
                tabItem(tabName = 'regular',
                        fluidRow(
                            h2('Regular Season Stats')
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
                                h2('Playoff Stats')
                        ),
                        fluidRow(
                                column(
                                    width = 6,
                                    selectInput(
                                        inputId = "seasonselect2",
                                        label = h4("Season"),
                                        choices = unique(),
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
                                        selected = 'CF%'
                                    )
                                ),
                                column(
                                    width = 2,
                                    selectInput(
                                        inputId = "teamstat4",
                                        label = h4("Stat Category X"),
                                        choices = vars2,
                                        selected = 'FO%'
                                    )
                                ),
                                column(
                                    width = 2,
                                    selectInput(
                                        inputId = "teamstat5",
                                        label = h4("Stat Category Y"),
                                        choices = vars2,
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

                ) #end tab3 tabItem

                # # Tab 4: Create your own team
                # tabItem(
                #     tabName = 'create',
                #     fluidRow(
                #         'Coming soon!',
                #         'Using different metrics on what you think is most important, construct your "dream team" and see if you can beat the champions!'
                #         
                #     ),
                #     
                #     # Tab 5: Glossary
                #     tabItem(tabName = 'glossary',
                #             fluidRow('glossary')) #end TabItem
                #     
                #     
                #     
                    
            )#end TabItems
        ) #end dashboardBody
            
    ) #end dashboardPage
)#end of shinyUI
        