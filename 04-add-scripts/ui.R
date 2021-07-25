# load libraries in ui.R
library(shiny)
library(shinydashboard)
library(plotly)
library(DT)

# dashboardPage begins
dashboardPage(
  
  # dashboardHeader begins
  dashboardHeader(title = 'Functions', titleWidth = 200), 
  # dashboardHeader ends
  
  # dashboardSidebar begins
  dashboardSidebar(width = 200,
                   
                   # sidebarMenu begin
                   sidebarMenu(
                     menuItem("Table", icon = icon("table"), tabName = "tab_1"),
                     menuItem("Plot", icon = icon("bar-chart-o"), tabName = "tab_2")
                     # ... you can add more items here
                   ) # sidebarMenu
  ), 
  # dashboardSidebar ends
  
  # dashboardBody begins
  dashboardBody(
    
    # tabs
    tabItems(
      tabItem(tabName = "tab_1",
              fluidRow(
                box(background = "navy", width = 12, 
                    column(3, selectInput(inputId = "select_table_dataset", 
                                          label = "Select dataset", 
                                          choices = c("mtcars", "iris"))),
                    br(),
                    column(3, actionButton(inputId = "show_table", label = "Show table"))
                    )
                ),
              div(style = "overflow-x: scroll; overflow-y: scroll", DT::dataTableOutput("table_output", width = 800))
              ),
      tabItem(tabName = "tab_2",
              fluidRow(
                box(background = "navy", width = 12,
                    column(3, selectInput(inputId = "select_plot_dataset", 
                                          label = "Select dataset", 
                                          choices = c("mtcars", "iris"))),
                    column(3, selectInput(inputId = "column_1", 
                                          choices = NULL,
                                          label = "Column 1")),
                    column(3, selectInput(inputId = "column_2", 
                                          choices = NULL,
                                          label = "Column 2")),
                    br(),
                    column(2, actionButton(inputId = "show_plot", label = "Show plot")))
              ),
              div(style = "overflow-x: scroll; overflow-y: scroll", plotly::plotlyOutput("plot_output"))
      )
    )
  ) 
  # dashboardBody ends
  
)
# dashboardPage ends
