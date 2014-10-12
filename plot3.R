## Code for Project 1 - Part 3: Coursera Exploratory Data Analysis
## Author: Richard  Brown
## Date Due: Oct. 12, 2014
## Read in relevant packages
library(dplyr)


## Read in the file about Electric Power Consumption

pwrdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## Format dates properly
pwrdata$Date <- as.Date(pwrdata$Date, format = "%d/%m/%Y")

## Filter only the data for date range: 2007-02-01 to 2007-02-02
pwrdata <- filter(pwrdata, Date >= "2007-02-01" & Date <= "2007-02-02")

## Clean data of any null spaces
pwrdata <- pwrdata[complete.cases(pwrdata),]

##consolidate date and time into a single column called DateTime and format it
pwrdata$DateTime = paste(as.character(pwrdata$Date), pwrdata$Time, sep = " ")
pwrdata$DateTime <- strptime(pwrdata$DateTime, format = "%Y-%m-%d %H:%M:%S")

## Create plot using BASE plotting system
with(pwrdata, plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(pwrdata, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(pwrdata, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty= 1, cex = 0.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Copy the plot into a png format
dev.copy(png, file = "plot3.png")
dev.off()