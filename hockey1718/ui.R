


# Shiny Layout
shinyUI(
    dashboardPagePlus(
        header = dashboardHeaderPlus(
            enable_rightsidebar = TRUE,
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
                        fluidRow('intro')),
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
                            ),
                            column(
                                width = 6,
                                selectInput(
                                    inputId = "teamstat",
                                    label = h4("Stat Category"),
                                    choices = vars,
                                    selected = 'CF%'
                                )
                            )
                        ), 
                        fluidRow(
                            tabBox(
                                width = 12,
                                tabPanel(
                                    title = 'Season Comparison', 
                                    plotOutput('season_graph')
                                )
                            )
                        ), # end fluidRow
                        fluidRow(
                            column(
                                width = 6,
                                selectInput(
                                    inputId = "teamstat1",
                                    label = h4("Stat Category"),
                                    choices = vars,
                                    selected = 'FO%'
                                )
                            ),
                            column(
                                width = 6,
                                selectInput(
                                    inputId = "teamstat2",
                                    label = h4("Stat Category"),
                                    choices = vars,
                                    selected = 'CF%'
                                )
                            ),
                        ),    
                        fluidRow(
                            tabBox(
                                width = 12,
                                tabPanel(
                                    title = 'Stat Comparison',
                                    plotlyOutput('stat_graph')
                                )
                            ) #end tabBox
                        ) #end fluidRow
                    )    #end tab2 tabItem
                
                
                # # Tab 3: Playoff Stats
                # tabItem(tabName = 'playoff',
                #         fluidRow()),
                # #end tab3 items
                # 
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
        