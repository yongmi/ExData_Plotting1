## Exploratory Data Analysis
## Project 1
## Plot 3
## December 7, 2014

setwd("~/Documents/Coursera/DataScienceTrack/ExploratoryDataAnalysis/Project1/ExData_Plotting1")

## Read data file in

## Slow and simple
hp <- read.csv2("household_power_consumption.txt", header=T, na.strings="?")

## Let's subset the observations to be used
hp$Date2<- as.Date(hp$Date,"%d/%m/%Y")
hp2 <-subset(hp,Date2==as.Date("2007-02-01")|Date2==as.Date("2007-02-02"))

hp2$day <- strftime(hp2$Date2, "%A")
hp2$DateTime <- strptime(paste(hp2$Date,hp2$Time), "%d/%m/%Y %T")

hp2$Sub_metering_1n<-as.numeric(as.character(hp2$Sub_metering_1))
hp2$Sub_metering_2n<-as.numeric(as.character(hp2$Sub_metering_2))
hp2$Sub_metering_3n<-as.numeric(as.character(hp2$Sub_metering_3))

par(mar=c(5,6,4,2))
par(cex.main=0.9, cex.lab=0.75, cex.axis=0.75)
dev.copy(png,"plot3.png",width=480,height=480,units="px")
plot(hp2$DateTime, hp2$Sub_metering_1n, type="l", xlab="", ylab="Energy sub metering")
lines(hp2$DateTime, hp2$Sub_metering_2n, type="l", col="red")
lines(hp2$DateTime, hp2$Sub_metering_3n, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.75, col=c("black","red","blue"), lwd=1);
dev.off()

