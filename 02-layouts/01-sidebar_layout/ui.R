# A sidebarLayout(): for placing a sidebarPanel() of inputs alongside a mainPanel() output content.

# sidebarLayout is a type of fluid page layout
ui <- fluidPage(
  
  # title of the app
  titlePanel("Sidebar Layout"),
  
  sidebarLayout(
    position = "left",
      
    # total width of sidebarPanel + mainPanel <= 12
    # sidebarPanel with all input elements
    # input elements have inputIds
    sidebarPanel(
      width = 4,
      # help text
      helpText("Sidebar Panel: This will have all the input elements"),
      # slider input
      sliderInput(inputId = "bins", label = "Number of bins:", min = 1, value = 30, max = 50),
      # text input
      textInput(inputId = "text1", label = "Input text:", value = "This is a textInput"),
      # action button
      actionButton(inputId = "button1", label = "This is an actionButton"),
      # another help text
      helpText("You can add as many elements as you want..."),
    ),
    
    # mainPanel with all output elements
    # output elements have outputIds
    mainPanel(
      width = 8,
      # help text
      helpText("Main Panel: This will have all the output elements"),
      # this is used to output plots
      plotOutput(outputId = "distPlot"),
      # this is used to output text
      textOutput(outputId = "text2"),
      # this is used to output tables
      dataTableOutput(outputId = "table1")
    )
  )
)
