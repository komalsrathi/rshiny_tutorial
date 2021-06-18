# server contains all logic 
# reads information from input objects (using the inputIds)
# and provides ouput to the output objects (using the outputIds)
library(ggplot2)
library(DT)
library(plotly)
server <- function(input, output) {
  
  # renderPlot is used to output plots
  output$distPlot <- renderPlot({
    
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
  # renderText is used to output text
  output$text1 <- renderText({
    "Below is the rawdata:"
  })
  
  # DT::renderTable is used to output table
  output$table1 <- DT::renderDataTable({
    DT::datatable(faithful, options = list(pageLength = 5))
  })
  
  # renderPlotly is used to output interactive plots
  output$plot2 <- plotly::renderPlotly({
    p <- ggplot(faithful, aes(x = eruptions, y = waiting)) +
      geom_point(pch = 21, size = 4, color = "navy", alpha = 0.5) +
      theme_bw()
    return(p)
  })
}