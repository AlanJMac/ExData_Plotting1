## This R file contains the R commands to create a plot of 
## Global_active_power against DateTime
## This code is for the Coursera course "Exploratory Data Analysis" project 1.
## This code corresponds to plot 2 in https://github.com/rdpeng/ExData_Plotting1
## ####

## Load the project data (assumed to exist in the current working directory)
inputData <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
## Subset the data - only interested in the dates 2007/02/01 and 2007/02/02
## (Note in this range there are no NA or '?' values)
inputDataFeb <- inputData[strptime(inputData$Date, "%d/%m/%Y") >= strptime("01/02/2007", "%d/%m/%Y") & strptime(inputData$Date, "%d/%m/%Y") <= strptime("02/02/2007", "%d/%m/%Y"),]

## Set class types of required columns
inputDataFeb$Global_active_power <- as.numeric(as.character(inputDataFeb$Global_active_power))

## Combine the Date and Time columns into a new column to plot against
inputDataFeb$DateTime <- strptime(paste(inputDataFeb$Date, inputDataFeb$Time), "%d/%m/%Y %H:%M:%S") 

## Plot to a PNG image file
png("plot2.png", width = 480, height = 480, units="px")
with(inputDataFeb, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()