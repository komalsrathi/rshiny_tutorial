library(ggplot2)
library(DT)
library(plotly)

server <- function(input, output, session){
  
  # Note: each output element has a corresponding function with a "render" prefix
  # that can be used to update the element
  
  # renderText is used to output text
  output$text_output <- renderText({
    input$text_input
  })
  
  # renderTable is used to output table
  output$table_output <- renderTable({
    get(input$select_input_table)
  })
  
  # renderUI is used to output hyperlinks
  url <- a("DT: An R interface to the DataTables library", href="https://rstudio.github.io/DT/", target="_blank")
  output$dt_link <- renderUI({
    tagList("URL link:", url)
  })
  
  # DT::renderTable is used to output data-table
  output$dt_table_output <- DT::renderDataTable({
    
    dat <- get(input$select_input_dt_table)
    DT::datatable(dat, 
                  options = list(pageLength = 5), 
                  filter = "bottom",
                  class = 'cell-border stripe')
    
  })
  
  # renderPlot is used to output plots
  output$plot_output <- renderPlot({
    
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$slider_input + 1)
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
  # renderPlotly is used to output interactive plots
  output$plotly_output <- plotly::renderPlotly({
    
    # predefining x and y based on the dataset chosen
    if(input$select_input_plotly == "iris"){
      x <- 'Sepal.Length'
      y <- 'Sepal.Width'
    } else if(input$select_input_plotly == "mtcars"){
      x <- 'mpg'
      y <- 'cyl'
    } else if(input$select_input_plotly == "mpg"){
      x <- 'year'
      y <- 'cyl'
    }
    
    # plot using ggplot
    dat <- get(input$select_input_plotly)
    p <- ggplot(dat, aes_string(x = x, y = y)) +
      geom_point(pch = 21, size = 4, color = "navy", alpha = 0.5) +
      theme_bw()
    return(p)
    
  })
}