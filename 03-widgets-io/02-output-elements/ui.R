library(shiny)
library(DT)
library(plotly)

ui <- fluidPage(
  
  # title of the app
  titlePanel("Output containers"),
  
  # output elements 
  tabsetPanel(
    tabPanel(title = "Text",
             sidebarPanel(
               textInput(inputId = "text_input", label = "Input text:", value = "")
             ),
             mainPanel(
               textOutput(outputId = "text_output"),
             )
    ),
    tabPanel(title = "Shiny Table",
             sidebarPanel(
               selectInput(inputId = "select_input_table", label = "Datasets", choices = c("iris", "mtcars", "mpg"), multiple = F)
             ),
             mainPanel(width = 20, 
                       tableOutput(outputId = "table_output")
             )
    ),
    tabPanel(title = "DT Table",
             sidebarPanel(
               uiOutput("dt_link"), br(),
               selectInput(inputId = "select_input_dt_table", label = "Datasets", choices = c("iris", "mtcars", "mpg"), multiple = F)
             ),
             mainPanel(width = 20, 
               DT::dataTableOutput(outputId = "dt_table_output")
             )
    ),
    tabPanel(title = "Plot",
             sidebarPanel(
               sliderInput(inputId = "slider_input", label = "Number of bins:", min = 1, value = 30, max = 50)
             ),
             mainPanel(
               plotOutput(outputId = "plot_output")
             )
    ),
    tabPanel(title = "Plotly",
             sidebarPanel(
               selectInput(inputId = "select_input_plotly", label = "Datasets", choices = c("iris", "mtcars", "mpg"), multiple = F)
             ),
             mainPanel(
               plotly::plotlyOutput(outputId = "plotly_output")
             )
    )
  )
)
