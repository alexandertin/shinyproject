



# Shiny function
shinyServer(function(input, output, session) {
    
        updateSelectizeInput(session = session, inputId = 'teamstat',
                             )
    
    
        season_stat <- reactive({
            season_stat = team2010_2019 %>% 
                filter(., Season == input$seasonselect)
        })
        
        
#Tab 2: Regular Season Stats
     output$season_graph <- renderPlotly({
         selstat <- season_stat %>% select(get(input$teamstat))
         plot_ly(selstat(), x=~hello, y=~goodbye)
        
     })
    
    output$regtable <- DT::renderDataTable({
            DT::datatable(regtbl,options=list(scrollX=TRUE))
            })
        
        
        
        
        
# Tab 3: Playoff Stats
        
        
        
        
        
# Tab 4: Create your own team
        
        
        
 
        
        
        
        
        
        
        
        
        
        
        
        
    
   
})
