#https://raw.githubusercontent.com/menonpg/COVID19_Chicago/master/timeSeries_COVID19_Chicago.csv

#Read Chicago COVID19 time series data into R as a data frame
myData<- read.csv("https://raw.githubusercontent.com/menonpg/COVID19_Chicago/master/timeSeries_COVID19_Chicago.csv")

#Convert the date column appropriately so R recognizes it as a Date
myData$Date <- as.Date(myData$Date, format="%Y-%m-%d")

#Summarize the columns
print(summary(myData))

#Write the file out to the local file system
#install.packages("xts") #use if not yet installed
library(xts)
myDataXTS <- as.xts(myData[,-c(3)], order.by=myData$Date)

#Plot the data a a time series using xts
write.csv(myData, "timeseries_COVID19_Chicago.csv")

#Repeat the plot using Plot_ly for an interactive plot
library(plotly)
p <- plot_ly(myData, x = ~Date, y = ~Cases, type = 'scatter', mode = 'lines') %>%
   add_trace( x = ~Date, y = ~Cases, type = 'scatter', mode = 'lines') %>%
   layout(title = "Cases and Seaths in Chicago owing to COVID19",
           xaxis = list(title = "Date"),
          yaxis = list(title = "Cases
