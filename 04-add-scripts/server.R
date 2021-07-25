# source functions in server.R
source('R/custom_table.R')
source('R/custom_plot.R')

shinyServer(function(input, output, session){
  
  # table output
  # when action_1 is pressed, the value of select_1 is evaluated
  # it is used to get the associated data
  observeEvent(input$show_table, {
    data <- input$select_table_dataset
    data <- get(data)
    
    # the function custom_table is called to visualize the data
    output$table_output <- DT::renderDataTable({
      custom_table(dat = data, pageLength = 10)
    })
    
  })
  
  # plot output
  # update select input options based on selected dataset
  observe({
    data <- input$select_plot_dataset
    data <- get(data)
    cols <- colnames(data)
    updateSelectInput(session = session, inputId = "column_1", choices = cols)
    updateSelectInput(session = session, inputId = "column_2", choices = cols)
  })
  
  # when show_plot is clicked, select_plot_dataset, column_1 and column_2 values are passed to corr_plot
  # function is called and output is rendered in plot_output
  output$plot_output <- plotly::renderPlotly({
    # don't show anything if button is not clicked
    # show_plot is outside isolate, so the output will take dependency on it
    if(input$show_plot == 0){
      return()
    }

    # what does isolate do? it stops dependencies on all reactive elements within the enclosed expression
    # tells shiny that the calling observer or reactive expression should not take a dependency on any reactive objects inside the expression.
    isolate({
      data <- get(input$select_plot_dataset)
      custom_plot(data = data,
                  x = input$column_1,
                  y = input$column_2)
    })
  })
  
})