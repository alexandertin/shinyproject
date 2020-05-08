
library(shiny)
library(data.table)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(DT)

nhlreg <- read.csv(file ="./data/NHLRegular_Total.csv")

nhlreg2 <- nhlreg[,0:204]

# Regular season table
regtbl = nhlreg2 %>% select(
    .,
    'DftYr',
    'Age',
    'Seasons',
    'H.Ref.Name',
    'Team',
    'GP',
    'G',
    'A',
    'CPP',
    'CriG',
    'CruG',
    'CruA1',
    'CruA2'
)



# Shiny function
shinyServer(function(input, output) {

        
        
#Tab 2: Regular Season Stats
        output$table <- DT::renderDataTable({
            datatable(regtbl, rownames = FALSE) %>% 
                formatStyle(input$selected,background = 'skyblue',
                            fontWeight ='bold')
            })
        
        
        
        
        
# Tab 3: Playoff Stats
        
        
        
        
        
# Tab 4: Create your own team
        
        
        
 
        
        
        
        
        
        
        
        
        
        
        
        
    
   
})
