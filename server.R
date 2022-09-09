server <- function(input, output) {
  
  
  output$mymap <- renderLeaflet({
    
    metadata <- metadata %>%
      slice(n = 1:input$slider)
    
    leaflet() %>%
      addTiles() %>%
      addCircleMarkers(data = metadata)
  })
  
  output$plotdepth <- renderPlot({
    
    metadata <- metadata %>%
      slice(n = 1:input$slider)
    
    ggplot(metadata, aes(x=Depth)) + geom_histogram()
    
  })
  
  output$plotlength <- renderPlot({
    
    length <- length %>%
      filter(scientific %in% c(input$species))
    
    ggplot(length, aes(x=length)) + geom_histogram()
    
  })

  
  
}