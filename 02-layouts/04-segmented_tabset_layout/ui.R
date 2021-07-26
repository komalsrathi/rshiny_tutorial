# Segmenting layouts using the tabsetPanel() and navlistPanel() functions.
library(shiny)
library(DT)
library(plotly)

ui <- fluidPage(
  
  # title of the app
  titlePanel("Grid layout with Tabsets"),
  
  # total width of fluidRow columns <= 12
  # fluidRow with three elements
  fluidRow(
    column(width = 4,
           sliderInput(inputId = "bins", label = "Number of bins:", min = 1, value = 30, max = 50)),
    column(width = 3, 
           textInput(inputId = "text1", label = "Input text:", value = "This is a textInput")),
    column(width = 3, 
           selectInput(inputId = "select1", label = "Options", choices = c("one", "two", "three"), multiple = F))
  ),
  
  # another fluidRow with one element
  fluidRow(
    column(width = 4,
           actionButton(inputId = "button1", label = "This is an actionButton")),
    br(), br()
  ),
  
  # instead of multiple fluidRows, organize outputs in tabs 
  tabsetPanel(
    tabPanel(title = "Histogram",
             plotOutput(outputId = "distPlot")),
    tabPanel(title = "Table",
             DT::dataTableOutput(outputId = "table1")),
    tabPanel(title = "Scatter",
             plotly::plotlyOutput(outputId = "plot2"))
  )
  
)
