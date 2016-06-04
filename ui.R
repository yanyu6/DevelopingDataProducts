library(shiny)

shinyUI(fluidPage(
  titlePanel("My Shiny APP - Stock Forecasting"),
  
  sidebarLayout(position = "right",
    sidebarPanel(
      h2("Instructions"),
      p("This is a simple APP for the final project of Developing Data Projects."),
      p("First, you can select a stock. Information will be collected from google finance."),
      p("Then, you can choose the start date and the end date you are interested in."),
      p("Next, you can select an exponential model to fit the data."),
      p("Finally, we do a simple forecasting of the stock open price."),
      
      br(),
      h3("Select a stock"),
      textInput("symb", "symbol", "AAPL"),
      
      br(),
      h3("Select dates"),
      dateRangeInput("dates", 
        "Date range",
        start = "2008-01-01", 
        end = as.character(Sys.Date())),
      
      br(),
      h3("Select an exponential model"),
      checkboxGroupInput("sm", "pick one model:",
                         c("SimpleExponentialModel" = 1,
                           "DoubleExponentialModel" = 2,
                           "TripleExponentialModel" = 3), selected = 1),

      br(),
      
      h2("Results"),
      p("In this APP, we only analyze the open price of the selected stock for a date range."),
      p("In the first plot, we decompose the time series data."),
      p("In the second figure, we compare the fitting curve (red line) to the original data curve (black line) by using different models."),
      p("In the third figure, we show the predicted three future values."),
     
      br(),
 
      submitButton("submit")
      
     
    ),
    
    mainPanel(
      plotOutput("plot1"),
      plotOutput("plot2"),
      plotOutput("plot3")
    )
  )
))