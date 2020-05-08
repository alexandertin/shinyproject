#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)



# Shiny Layout
shinyUI(
    
    dashboardPage(
    dashboardHeader(title = 'NHL 2017-18 Season Analysis',
                    titleWidth = 350),
    dashboardSidebar(
        sidebarUserPanel("Alex Tin BDS021", image = 'https://i.pinimg.com/originals/6c/ce/de/6ccede86e8a11d520f5e7a3386d46ff0.jpg'),
        sidebarMenu(
            menuItem(
                "Introduction", 
                tabName = 'intro', 
                icon = icon('book')
            ), 
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
                "Create your own team",
                tabName = 'create',
                icon = icon('fas fa-funnel-dollar')
            ),
            menuItem(
                "Glossary",
                tabName = 'glossary',
                icon = icon('fas fa-atlas')
            )
            
        )
        
    ),
    
    
    
    
    #Introduction
    dashboardBody(
        
        tabItems(
        #Tab 1: Intro
        tabItem(tabName = 'intro',
                'intro'),
        
        
        # Tab 2: Regular Season Stats
        tabItem(tabName = 'regular',
                fluidPage(
                    titlePanel("Regular Season Stats"),
                    
                    tabsetPanel(
                        # tabPanel("Player Comparisons", 
                        #          # fluidRow(
                        #          #     column(3,
                        #          #            h4("Team selection"),
                        #          #            selectInput("Division", label=h3("Division"),
                        #          #                        ))
                        #          # )
                        #          
                        #          ),
                        
                        tabPanel("Player Table",
                                 
                                 fluidRow(box(DT::dataTableOutput("regtbl"), width=12))
                                
                                 )
                        
                        
                    )
                )
                ), 
        
        
        # Tab 3: Playoff Stats
        tabItem(tabName = 'playoff',
                'to be replaced with playoff stats'
                ),
        
        # Tab 4: Create your own team
        tabItem(
            tabName = 'create',
            'Coming soon!',
            'Using different metrics on what you think is most important, construct your "dream team" and see if you can beat the champions!'
                
                ),
        
        # Tab 5: Glossary
        tabItem(tabName = 'glossary',
                'glossary'
                )
        
        
        
    )
    )))




