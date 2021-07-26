server <- function(input, output, session){
  
  # Note: each input element has a corresponding function with an "update" prefix
  # that can be used to update the element
  
  # update checkboxGroupInput based on user selection
  observe({
    ch <- input$enter_choices
    ch <- trimws(unlist(strsplit(ch, ",")))
    updateCheckboxGroupInput(session = session, inputId = "select_choice", choices = ch)
  })
  
  # update selectInput based on textInput
  observe({
    dat <- input$enter_dataset
    dat <- trimws(unlist(strsplit(dat, ",")))
    updateSelectInput(session = session, inputId = "select_dataset", choices = dat)
  })
  
  # update pickerInput based on selectInput
  observe({
    dat <- input$select_dataset
    
    # only if dat is an internal dataset, update the columns
    if(dat %in% data()$results){
      dat <- get(dat)
      cols <- colnames(dat)
      updatePickerInput(session = session, inputId = "select_cols", choices = cols)
    } else {
      updatePickerInput(session = session, inputId = "select_cols", choices = "N/A")
    }
    
  })
  
}