function(input, output) {
  
  output$checkboxOut <- renderPrint({ input$checkbox })
  output$radioOut <- renderPrint({ input$radio })
  output$selectOut <- renderPrint({ input$select })
  output$numOut <- renderPrint({ input$num })
  output$textOut <- renderPrint({ input$text })
  output$checkGroupOut <- renderPrint({ input$checkGroup })
  output$pickerOut <- renderPrint({ input$picker })
  output$selectizeOut <- renderPrint({ input$selectize })
  output$slider1Out <- renderPrint({ input$slider1 })
  output$slider2Out <- renderPrint({ input$slider2 })
  output$dateOut <- renderPrint({ input$date })
  output$datesOut <- renderPrint({ input$dates })
  output$fileOut <- renderPrint({ input$file })
  output$actionOut <- renderPrint({ input$action })
  
}