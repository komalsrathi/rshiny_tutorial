library(shiny)

ui <- fluidPage(
  
  # title of the app
  titlePanel("Update outputs"),
  
  # output elements 
  fluidRow(
    column(12, h4("Note that observe and reactive work very much the same on the surface,
     it is when we get into the server where we see the differences, and how those
     can be exploited for different uses."))
  ),
  tabsetPanel(
    tabPanel(title = "Reactive Test",
             sidebarPanel(
               textInput(inputId = "test_reactive", label = "Test_Reactive")
             ),
             mainPanel(
               textOutput(outputId = "test_reactive_text"),
               DT::dataTableOutput(outputId = "test_reactive_table")
             )
    ),
    tabPanel(title = "Observe Test",
             sidebarPanel(
               textInput(inputId = "test_observe", label = "Test_Observe")
             ),
             mainPanel(
               textOutput(outputId = "test_observe_text"),
               DT::dataTableOutput(outputId = "test_observe_table")
             )
    ),
    tabPanel(title = "Observe Event Test",
             sidebarPanel(
               textInput(inputId = "test_observe_event", label = "Test_OberveEvent"),
               br(),
               actionButton(inputId = "submit", label = "Submit")
             ),
             mainPanel(
               textOutput(outputId = "test_observe_event_text"),
               DT::dataTableOutput(outputId = "test_observe_event_table")
             )
    )
  )
)
