## Exploratory Data Analysis
## Project 1
## Plot 1
## December 6, 2014

setwd("~/Documents/Coursera/DataScienceTrack/ExploratoryDataAnalysis/Project1/ExData_Plotting1")

## Read data file in

## Slow and simple
hp <- read.csv2("household_power_consumption.txt", header=T)

## A bit more involved, using sql. although the following doesn't seem to work
##library(sqldf)
##HP<-read.csv2.sql("household_power_consumption.txt", header=TRUE, sql="select * from file where Date='01/02/2007'or Date='02/02/2007'")

## Let's subset the observations to be used
hp$Date2<- as.Date(hp$Date,"%d/%m/%Y")
hp2 <-subset(hp,Date2==as.Date("2007-02-01")|Date2==as.Date("2007-02-02"))

hp2$Global_active_power2<-as.numeric(hp2$Global_active_power)

par(mar=c(5,6,4,2))
par(cex.main=0.9, cex.lab=0.75, cex.axis=0.75)
dev.copy(png,"plot1.png",width=480,height=480,units="px")
hist(hp2$Global_active_power2/500, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

