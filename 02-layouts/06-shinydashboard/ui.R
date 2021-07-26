library(shiny)
library(shinydashboard)
library(plotly)
library(DT)

# dashboardPage begins
dashboardPage(
  
  # dashboardHeader begins
  dashboardHeader(title = 'Dashboard', titleWidth = 400), 
  # dashboardHeader ends
  
  # dashboardSidebar begins
  dashboardSidebar(width = 400,
                   
                   # sidebarMenu begin
                   sidebarMenu(
                     menuItem("Analysis1", icon = icon("dashboard"), tabName = "analysis1"),
                     menuItem("Analysis2", icon = icon("dashboard"), tabName = "analysis2"),
                     menuItem("Analysis3", icon = icon("dashboard"), tabName = "analysis3")
                   ) 
                   # sidebarMenu ends
  ), 
  # dashboardSidebar ends
  
  # dashboardBody begins
  dashboardBody(

    # tabItems begins (superset of tab item)
    tabItems(
      # for each menuItem, there should be a corresponding tabItem
      tabItem(tabName = "analysis1",
              
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
              # tabsetPanel for outputs
              tabsetPanel(
                tabPanel(title = "Histogram",
                         plotOutput(outputId = "distPlot", width = "100%")),
                tabPanel(title = "Table",
                         DT::dataTableOutput(outputId = "table1")),
                tabPanel(title = "Scatter",
                         plotly::plotlyOutput(outputId = "plot2"))
              )
            ),
      # another tab item
      tabItem(tabName = "analysis2"),
      tabItem(tabName = "analysis3")
    )
    # tabItems ends
  )
  # dashboardBody ends
)
# dashboardPage ends