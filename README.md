# DevelopingDataProducts
This simple Shiny application is the first part of my final project for the developing data products course. After I create a Shiny application and deploy it on Rstudio's servers. I use Rstudio Presenter to prepare a reproducible pitch presentation about my application and publish it on Rpubs.

In this application, you need first select a stock. Information of the stock will be collected from google finance. Then, you can choose the start date and the end date you are interested in. Then, we will analyze the open price of the stock and decompose the time series data. Next, You can select different exponential models that we can use to fit the time series data. Finally, we will predict three future values of the selected stock.

The stock forecasting application has been deployed at [link]( https://yanyu6.shinyapps.io/stockProj/)

Since this is really a preliminary web application, there are several things can be further improved in the furture. First, when you select the dates, you cannot select the dates within a year. Second, the default fitting model is the simple exponential model. We definitely can try more comprehensive models in the future.
