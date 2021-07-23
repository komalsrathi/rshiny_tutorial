# server contains all logic 
server <- function(input, output) {
  
  # renderPlot is used to output plots
  output$distPlot <- renderPlot({
    
    # old faithful data
    x <- faithful$waiting
    bins <- seq(from = min(x), to = max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
}