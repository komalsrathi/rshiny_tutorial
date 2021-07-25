library(shiny)

ui <- fluidPage(
  
  # title of the app
  titlePanel("Update inputs"),
  
  # output elements 
  tabsetPanel(
    tabPanel(title = "Update using external input",
             sidebarPanel(
               textInput(inputId = "enter_choices", label = "Enter choices"),
               checkboxGroupInput(inputId = "select_choice", label = "Select choice", choices = NULL)
             ),
             mainPanel(
               # empty for demo
             )
    ),
    tabPanel(title = "Update using other inputs",
             sidebarPanel(
               textInput(inputId = "enter_dataset", label = "Enter dataset"),
               selectInput(inputId = "select_dataset", label = "Select dataset", choices = NULL, selected = "none"),
               pickerInput(inputId = "select_cols", label = "Select Columns", choices = NULL)
             ),
             mainPanel(
               # empty for demo
             )
    )
  )
)
