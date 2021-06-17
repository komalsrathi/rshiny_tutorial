# Grid layouts using Shiny’s grid layout system (i.e., fluidRow() & column()).
library(shiny)
library(DT)
library(plotly)

# this is also a type of fluid page layout
# a fluid page layout consists of rows which in turn include columns
ui <- fluidPage(
  
  # title of the app
  titlePanel("Grid Layout"),
  
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
           actionButton(inputId = "button1", label = "This is an actionButton"))
  ),
  
  # fluidRow with 2 output elements
  # always use DT::dataTableOutput for data tables (flexible and customizable)
  fluidRow(
    column(width = 8, 
           plotOutput("distPlot")),
    column(width = 4, 
           DT::dataTableOutput(outputId = "table1"))
  ),
  
  # fluidRow with one output element
  # here is an example of plotlyOutput
  fluidRow(
    column(width = 12, 
           plotly::plotlyOutput(outputId = "plot2"))
  )
  
  # you can add as many rows as you want 
  # but try to align the elements to fit in the 12 grid system
)
