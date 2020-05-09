



# Shiny function
shinyServer(function(input, output,session) {
    observe({
        
        
    })
        
        
#Tab 2: Regular Season Stats
     output$avgseason_stat <- renderPlotly({
         plot_ly(avgseasonstat, x = ~Season, y = ~, type = 'scatter', mode = 'lines') %>% 
             layout(xaxis = list(title = "Season"), yaxis = list(title))

     })
    
    output$regtable <- DT::renderDataTable({
            DT::datatable(regtbl,options=list(scrollX=TRUE))
            })
        
        
        
        
        
# Tab 3: Playoff Stats
        
        
        
        
        
# Tab 4: Create your own team
        
        
        
 
        
        
        
        
        
        
        
        
        
        
        
        
    
   
})
