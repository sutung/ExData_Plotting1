## Plot 3

source("load-dataset.R")


png(filename = "plot3.png", height=480, width=480)
with(sub_power,
     plot(Sub_metering_1~dateTime, type="l",
          ylab="Global Active Power (kilowatts)", xlab=""))
with(sub_power,lines(Sub_metering_2~dateTime,type="l",col='Red'))
with(sub_power,lines(Sub_metering_3~dateTime,type="l",col='Blue'))

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
