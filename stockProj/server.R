# server.R

library(quantmod)
library(forecast)


shinyServer(function(input, output) {
  
  dataInput <- reactive({
    getSymbols(input$symb, src = "google",
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
    
  })
  ts1 <- function(data){
    msymb <- to.monthly(data)
    stockopen <- Op(msymb)
    ts1 <- ts(stockopen, frequency = 12)
  }
  output$plot1 <- renderPlot({
    plot(decompose(ts1(dataInput())), xlab = "Years +1")
  })
  
  fit <- function(data){
     if (input$sm == 1){
      fit <- HoltWinters(data, beta=FALSE, gamma=FALSE)
    }else if (input$sm == 2){
      fit <- HoltWinters(data, gamma=FALSE)
    }else if (input$sm == 3){
      fit <- HoltWinters(data)
    }
   
  }
  
  
    
  output$plot2 <- renderPlot({
    plot(fit(ts1(dataInput())), xlab = "Years+1", ylab = input$symb)
  }) 

  output$plot3 <- renderPlot({
    forecast(fit(ts1(dataInput())), 3)
    plot(forecast(fit(ts1(dataInput())), 3), xlab = "Years+1", ylab = input$symb)
  })

 })