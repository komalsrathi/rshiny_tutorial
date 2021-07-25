server <- function(input, output, session){
  
  # Note: no real difference between reactive and observe from the user perspective, only the server side
  
  # 1. create a reactive environment. 
  # store input value in result_reactive which is available to other elements by calling reactive_var()
  # you can change the value of result_reactive by changing the value of the dependency (i.e. input$test_reactive)
  reactive_var <- reactive({
    result_reactive <- input$test_reactive
  })
  
  # text output
  output$test_reactive_text <- renderText({
    reactive_var()
  })
  
  # table output
  output$test_reactive_table <- DT::renderDataTable({
    get(reactive_var())
  })
  
  # 2. eventReactive
  # reactive expression
  reactive_expression <- eventReactive(input$submit_event_reactive, {
    input$test_event_reactive
  })
  
  # text output
  output$test_event_reactive_text <- renderText({
    reactive_expression()
  })
  
  # table output
  output$test_event_reactive_table <- DT::renderDataTable({
    dat <- reactive_expression()
    get(dat)
  })
  
  # 3. create an observe environment. 
  # instantaneous update of input and output elements. 
  # we cannot access "result_observe" outside of this env. 
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
  
  # 4. observeEvent depends on an external trigger
  # we can change any input as much as we want, but the code wont run until the trigger
  # input$submit_observe_event is pressed. 
  # we cannot access "result_observe_event" outside of this env. 
  observeEvent(input$submit_observe_event, {
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
  
  # 5. reactiveValues: reactiveValues can be used to store objects, to which other expressions can take a dependency
  # also similar to observeEvent but values are accessible to other elements
  reactive_val <- reactiveValues(
    # you cannot use <- assignment operator here
    text = "No text has been submitted yet." 
  )
  
  # text output
  output$test_reactive_value_text <- renderText({
    reactive_val$text
  })
  
  # table output
  # observe event for updating the reactiveValues
  observeEvent(input$submit_reactive_value, {
    reactive_val$text <- input$test_reactive_value

    # update table using the reactive value
    output$test_reactive_value_table <- DT::renderDataTable({
      get(reactive_val$text)
    })
  })
  
  
}