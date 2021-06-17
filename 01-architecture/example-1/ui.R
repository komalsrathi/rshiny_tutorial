library(shiny)

# user interface
ui <- fluidPage(
  
  # title
  titlePanel("Example 1"),
  
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
