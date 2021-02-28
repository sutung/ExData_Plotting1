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


## Plot 1
png(filename = "plot1.png", height=480, width=480)
hist(sub_power$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()

## Plot 2
png(filename = "plot2.png", height=480, width=480)
plot(sub_power$Global_active_power~sub_power$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

## Plot 3
png(filename = "plot3.png", height=480, width=480)
with(sub_power,
     plot(Sub_metering_1~dateTime, type="l",
          ylab="Global Active Power (kilowatts)", xlab=""))
with(sub_power,lines(Sub_metering_2~dateTime,type="l",col='Red'))
with(sub_power,lines(Sub_metering_3~dateTime,type="l",col='Blue'))

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
## Create Plot 4 
png(filename = "plot4.png", height=480, width=480)
dev.cur()
par(mfrow=c(2,2))
with(sub_power, {
  plot(Global_active_power~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~dateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()
