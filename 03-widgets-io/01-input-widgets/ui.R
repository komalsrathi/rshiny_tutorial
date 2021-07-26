library(shiny)
library(shinyWidgets)
fluidPage(
  
  tags$head(tags$style(HTML("
    .shiny-text-output {
      background-color:#fff;
    }
  "))),
  h1("Shiny", span("Widgets Gallery", style = "font-weight: 300"), 
     style = "font-family: 'Source Sans Pro';
        color: #fff; text-align: center;
        background-image: url('texturebg.png');
        padding: 20px"),
  br(),
  fluidRow(
    column(6, offset = 3,
           p("For each widget below, the Current Value(s) window 
        displays the value that the widget provides to shinyServer. 
        Notice that the values change as you interact with the widgets.", 
             style = "font-family: 'Source Sans Pro';")
    )
  ),
  br(),
  fluidRow(
    column(4,
           wellPanel(
             h3("Single checkbox"),
             checkboxInput("checkbox", label = "Choice A", 
                           value = TRUE),
             hr(),
             p("Current Value:", style = "color:#888888;"), 
             verbatimTextOutput("checkboxOut")
           )),
    column(4,
           wellPanel(
             radioButtons("radio", label = h3("Radio buttons"),
                          choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3"), 
                          selected = 1),
             hr(),
             p("Current Values:", style = "color:#888888;"), 
             verbatimTextOutput("radioOut")
           )),
    column(4,
           wellPanel(
             selectInput("select", label = h3("Select box"), 
                         choices = list("Choice 1" = 1, "Choice 2" = 2,
                                        "Choice 3"), selected = "Choice 3"),
             hr(),
             p("Current Value:", style = "color:#888888;"), 
             verbatimTextOutput("selectOut")
           ))
  ),
  fluidRow(
    column(4,
           wellPanel(
             numericInput("num", label = h3("Numeric input"), value = 1),
             hr(),
             p("Current Value:", style = "color:#888888;"), 
             verbatimTextOutput("numOut")
           )),
    column(4,
           wellPanel(
             textInput("text", label = h3("Text input"), 
                       value = "Enter text..."),
             hr(),
             p("Current Value:", style = "color:#888888;"), 
             verbatimTextOutput("textOut")
           ))
  ),
  fluidRow(
    column(4,
           wellPanel(
             checkboxGroupInput("checkGroup", 
                                label = h3("Checkbox group"), 
                                choices = list("Choice 1" = 1, "Choice 2" = 2, 
                                               "Choice 3" = 3),
                                selected = 1),
             hr(),
             p("Current Values:", style = "color:#888888;"), 
             verbatimTextOutput("checkGroupOut")
           )),
    column(4,
           wellPanel(
             shinyWidgets::pickerInput(inputId = "picker", label = h3("Picker Input"),
                         choices = c("A", "B", "C"), multiple = TRUE, options = list(`actions-box` = TRUE)),
             hr(),
             p("Current Value:", style = "color:#888888;"), 
             verbatimTextOutput("pickerOut")
           )),
    column(4,
           wellPanel(
             selectizeInput(inputId = "selectize", label = h3("Selectize Input"),
                            choices = c("A", "B", "C"), multiple = TRUE, options = list(create = TRUE)),
             hr(),
             p("Current Value:", style = "color:#888888;"), 
             verbatimTextOutput("selectizeOut")
           ))
  ),
  fluidRow(
    column(4,
           wellPanel(
             sliderInput("slider1", label = h3("Slider"), min = 0, max = 100, 
                         value = 50),
             hr(),
             p("Current Value:", style = "color:#888888;"), 
             verbatimTextOutput("slider1Out")
           )),
    
    column(4,
           wellPanel(
             sliderInput("slider2", label = h3("Slider range"), min = 0, 
                         max = 100, value = c(25, 75)),
             hr(),
             p("Current Values:", style = "color:#888888;"), 
             verbatimTextOutput("slider2Out")
           ))
  ),
  fluidRow(
    column(4,
           wellPanel(
             dateInput("date", label = h3("Date input"), value = "2014-01-01"),  
             hr(),
             p("Current Value:", style = "color:#888888;"), 
             verbatimTextOutput("dateOut")
           )),
    
    column(4,
           wellPanel(
             dateRangeInput("dates", label = h3("Date range")),
             hr(),
             p("Current Values:", style = "color:#888888;"), 
             verbatimTextOutput("datesOut")
           ))
  ),
  
  fluidRow(
    column(4,
           wellPanel(
             fileInput("file", label = h3("File input")),
             hr(),
             p("Current Value:", style = "color:#888888;"), 
             verbatimTextOutput("fileOut")
           )),
    column(4,
           wellPanel(
             h3("Action button"),
             actionButton("action", label = "Action"),
             hr(),
             p("Current Value:", style = "color:#888888;"), 
             verbatimTextOutput("actionOut")
           ))
  )
)