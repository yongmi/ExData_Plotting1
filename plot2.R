## Exploratory Data Analysis
## Project 2
## December 7, 2014

setwd("~/Documents/Coursera/DataScienceTrack/ExploratoryDataAnalysis/Project1/ExData_Plotting1")

## Read data file in

## Slow and simple
hp <- read.csv2("household_power_consumption.txt", header=T, na.strings="?")

## Let's subset the observations to be used
hp$Date2<- as.Date(hp$Date,"%d/%m/%Y")
hp2 <-subset(hp,Date2==as.Date("2007-02-01")|Date2==as.Date("2007-02-02"))

hp2$Global_active_power2<-as.numeric(hp2$Global_active_power)
hp2$day <- strftime(hp2$Date2, "%A")
hp2$DateTime <- strptime(paste(hp2$Date,hp2$Time), "%d/%m/%Y %T")

par(mar=c(5,6,4,2))
par(cex.main=0.9, cex.lab=0.75, cex.axis=0.75)
dev.copy(png,"plot2.png",width=480,height=480,units="px")
plot(hp2$DateTime, hp2$Global_active_power2/500, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

