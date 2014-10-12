## Code for Project 1 - Part 1: Coursera Exploratory Data Analysis
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

## Create plot using BASE plotting system
hist(pwrdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

##Copy the plot into a png format
dev.copy(png, file = "plot1.png")
dev.off()