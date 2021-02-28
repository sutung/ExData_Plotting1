## Plot 1
source("load-dataset.R")

png(filename = "plot1.png", height=480, width=480)
hist(sub_power$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()
