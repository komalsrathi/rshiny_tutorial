library(shiny)

ui <- fluidPage(
  
  # title of the app
  titlePanel("Update outputs"),
  
  # output elements 
  fluidRow(
    column(12, 
           h4("reactive, reactiveValue and eventReactive are various kinds of reactive expressions in Shiny. They yield output which can be used as input in other expressions, which will in turn take a dependency on the reactive expression."),
           h4("observe and observeEvent are similar to reactive expressions. The big difference is that the observers do not yield any output and thus they are only useful for their side effects.")),
    br(),
    column(12, 
           h4("Same is the case with observeEvent and reactiveValues")),
    br()
  ),
  tabsetPanel(
    tabPanel(title = "reactive",
             h4("reactive expressions can be used to return values making them available outside of its environment"),
             h4("it depends on elements specified within the expression: as soon as input changes, the output text and table are updated"),
             h4("reactive expressions should be used for calculations derived from other values"),
             br(),
             sidebarPanel(
               textInput(inputId = "test_reactive", label = "Input")
             ),
             mainPanel(
               textOutput(outputId = "test_reactive_text"), 
               br(),
               DT::dataTableOutput(outputId = "test_reactive_table")
             )
    ),
    tabPanel(title = "eventReactive",
             h4("This depends on an external trigger"),
             h4("The output text and table are not updated until the button is pressed"),
             sidebarPanel(
               textInput(inputId = "test_event_reactive", label = "Input"),
               br(),
               actionButton(inputId = "submit_event_reactive", label = "Submit")
             ),
             mainPanel(
               textOutput(outputId = "test_event_reactive_text"),
               DT::dataTableOutput(outputId = "test_event_reactive_table")
             )
    ),
    tabPanel(title = "observe",
             h4("An observe expression is triggered every time one of its inputs changes."),
             h4("Instantaneous update of input and output elements."),
             h4("Any change in values captured by observed is not available outside of the observe environment."),
             h4("A observe expression yields no output, and it should only be used for its side effects (such as modifying a reactiveValues object, or triggering a pop-up)."),
             h4("Any elements that need to be updated have to be enclosed within the observe environment"),
             h4("Also, observe does not ignore NULL's, therefore it will fire even if its inputs are still NULL."),
             h4("Note that observe and reactive work very much the same on the surface, it is when we get into the server where we see the differences, and how those can be exploited for different uses."),
             br(),
             sidebarPanel(
               textInput(inputId = "test_observe", label = "Input")
             ),
             mainPanel(
               textOutput(outputId = "test_observe_text"),
               DT::dataTableOutput(outputId = "test_observe_table")
             )
    ),
    tabPanel(title = "observeEvent",
             h4("observeEvent depends on an external trigger"),
             h4("observeEvent by default does ignore NULL (preferable and recommended)"),
             h4("We can change any input as much as we want, but the code wont run until the trigger"),
             h4("Similar to observe, we cannot access values/variables outside of this env."),
             br(),
             sidebarPanel(
               textInput(inputId = "test_observe_event", label = "Input"),
               br(),
               actionButton(inputId = "submit_observe_event", label = "Submit")
             ),
             mainPanel(
               textOutput(outputId = "test_observe_event_text"),
               DT::dataTableOutput(outputId = "test_observe_event_table")
             )
    ),
    tabPanel(title = "reactiveValues",
             h4("Difference between reactive and reactiveValues: reactiveValues does not depend on other elements"),
             h4("reactiveValues can be used to store 'true state', to which other expressions can take a dependency"),
             sidebarPanel(
               textInput(inputId = "test_reactive_value", label = "Input"),
               br(),
               actionButton(inputId = "submit_reactive_value", label = "Submit")
             ),
             mainPanel(
               textOutput(outputId = "test_reactive_value_text"),
               DT::dataTableOutput(outputId = "test_reactive_value_table")
             )
    )
  )
)
