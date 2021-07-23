library(shiny)

# user interface
ui <- fluidPage(
  
  # title
  titlePanel("Using single app.R"),
  
  # side bar layout starts
  # layout encloses side bar and main panels
  sidebarLayout(
    
    # side bar panel starts
    sidebarPanel(
      
      # organize all your input elements here
      # slider input
      sliderInput(inputId = "bins", label = "Number of bins:",
                  min = 1, max = 50, value = 30)
      
    ), 
    # side bar panel ends
    
    # main panel starts 
    mainPanel(
      
      # put all your output elements
      plotOutput(outputId = "distPlot")
      
    ) 
    # main panel ends
  )
  # side bar layout ends
)
# fluidPage ends

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

# create a shiny app object
shinyApp(ui = ui, server = server)
