# server contains all logic 
# reads information from input objects (using the inputIds)
# and provides ouput to the output objects (using the outputIds)
server <- function(input, output) {
  
  # renderPlot is used to output plots
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
  # renderText is used to output text
  output$text2 <- renderText({
    "Below is the rawdata:"
  })
  
  # renderTable is used to output table
  output$table1 <- renderDataTable({
    faithful
  })
}