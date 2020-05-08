
library(shiny)
library(data.table)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(DT)




# Shiny function
shinyServer(function(input, output) {

        
        
#Tab 2: Regular Season Stats
        output$regtable <- DT::renderDataTable({
            DT::datatable(regtbl,options=list(scrollX=TRUE))
            })
        
        
        
        
        
# Tab 3: Playoff Stats
        
        
        
        
        
# Tab 4: Create your own team
        
        
        
 
        
        
        
        
        
        
        
        
        
        
        
        
    
   
})
