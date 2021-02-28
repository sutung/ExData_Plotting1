# Download the and save the household_power_consumption.txt in the same folder
# Load the dataset into dataframe dpower
dpower <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
str(dpower)

# Remove the null 
dpower <- na.omit(dpower)

## convert date to Type Date
dpower$Date <- as.Date(dpower$Date, "%d/%m/%Y")


## subset the date from 2007-02-01 until 2007-02-02 to new dataset sub_power
sub_power <- subset(dpower,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Combine Date and Time column
dateTime <- paste(sub_power$Date, sub_power$Time)

## set the DateTime Vector name
dateTime <- setNames(dateTime, "DateTime")
str(dateTime)

## Remove the original Date and Time column
sub_power <- sub_power[ ,!(names(sub_power) %in% c("Date","Time"))]

## Add the new DateTime column into the dataframe sub_power
sub_power <- cbind(dateTime, sub_power)

## Format dateTime Column to POSIXct
sub_power$dateTime <- as.POSIXct(dateTime)

