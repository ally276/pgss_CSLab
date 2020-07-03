#https://raw.githubusercontent.com/menonpg/COVID19_Chicago/master/timeSeries_COVID19_Chicago.csv

myData<- read.csv("https://raw.githubusercontent.com/menonpg/COVID19_Chicago/master/timeSeries_COVID19_Chicago.csv")

myData$Date <- as.Date(myData$Date, format="%Y-%m-%d")
print(summary(myData))
