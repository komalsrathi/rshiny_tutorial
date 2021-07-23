server <- function(input, output, session){
  
  # Note: No real difference between reactive and observe from the user perspective, only the server side
  
  # Create a reactive environment. We can access "result_reactive" by calling the reactive environments i.e. reactive_var_table() or reactive_var_text(). 
  
  # text output
  reactive_var_text <- reactive({
    result_reactive <- input$test_reactive
  })
  
  output$test_reactive_text <- renderText({
    reactive_var_text()
  })
  
  # table output
  reactive_var_table <- reactive({
    result_reactive <- input$test_reactive
    get(result_reactive)
  })
  
  output$test_reactive_table <- DT::renderDataTable({
    reactive_var_table()
  })
  
  # Create an observe environment. We cannot access "result_observe" outside of this env. 
  observe({
    result_observe <- input$test_observe
    
    # text output
    output$test_observe_text <- renderText({
      result_observe
    })
    
    # table output
    output$test_observe_table <- DT::renderDataTable({
      get(result_observe)
    })
  })
  
  # observeEvent depends on an external trigger
  # we can change any input as much as we want, but the code wont run until the trigger
  # input$Submit is pressed.
  observeEvent(input$submit, {
    result_observe_event <- input$test_observe_event
    
    # text
    output$test_observe_event_text <- renderText({
      result_observe_event
    })
    
    # table
    output$test_observe_event_table <- DT::renderDataTable({
      get(result_observe_event)
    })
  })
  
}