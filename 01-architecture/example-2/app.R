library(shiny)

# user interface
ui <- fluidPage(
  
  # title
  titlePanel("Hello Shiny!"),
  
  # side bar layout starts
  # layout encloses panels
  sidebarLayout(
    
    # side bar panel starts
    sidebarPanel(
      
      # organize all your input widgets here
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ), 
    # side bar panel ends
    
    # main panel starts 
    mainPanel(
      
      # put all your output widgets
      plotOutput(outputId = "distPlot")
      
    ) 
    # main panel ends
  )
  # side bar layout ends
)
# ui ends

# server contains all logic 
server <- function(input, output) {
  
  # renderPlot is used to output plots
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
}

shinyApp(ui = ui, server = server)
