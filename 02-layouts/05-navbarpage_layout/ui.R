# Creating applications with multiple top-level components using the navbarPage() function.

ui <- navbarPage("Application with multiple sections",
                 tabPanel("Sidebar layout",
                          sidebarLayout(
                            position = "left",
                            
                            # total width of sidebarPanel + mainPanel <= 12
                            # sidebarPanel with all input elements
                            # input elements have inputIds
                            sidebarPanel(
                              width = 4,
                              sliderInput(inputId = "bins", label = "Number of bins:", min = 1, value = 30, max = 50)
                            ),
                            
                            # mainPanel with all output elements
                            # output elements have outputIds
                            mainPanel(
                              width = 8,
                              plotOutput(outputId = "distPlot"),
                              dataTableOutput(outputId = "table")
                            )
                          )),
                 tabPanel("Grid layout",
                          # total width of fluidRow columns <= 12
                          # fluidRow with three elements
                          fluidRow(
                            column(width = 4,
                                   sliderInput(inputId = "bins1", label = "Number of bins:", min = 1, value = 30, max = 50))
                          ),
                          
                          # fluidRow with 2 output elements
                          # always use DT::dataTableOutput for data tables (flexible and customizable)
                          fluidRow(
                            column(width = 8, 
                                   plotOutput("distPlot1")),
                            column(width = 4, 
                                   DT::dataTableOutput(outputId = "table1"))
                          ),
                          
                          # fluidRow with one output element
                          # here is an example of plotlyOutput
                          fluidRow(
                            column(width = 12, 
                                   plotly::plotlyOutput(outputId = "plot1"))
                          )),
                 tabPanel("Tabset layout",
                          # fluidRow with three elements
                          fluidRow(
                            column(width = 4,
                                   sliderInput(inputId = "bins2", label = "Number of bins:", min = 1, value = 30, max = 50))
                          ),
                          
                          # instead of multiple fluidRows, organize outputs in tabs 
                          tabsetPanel(
                            tabPanel(title = "Histogram",
                                     plotOutput(outputId = "distPlot2")),
                            tabPanel(title = "Table",
                                     DT::dataTableOutput(outputId = "table2")),
                            tabPanel(title = "Scatter",
                                     plotly::plotlyOutput(outputId = "plot2"))
                          )),
                 navbarMenu("More",
                            tabPanel("Sub-Component A"),
                            tabPanel("Sub-Component B"))
)