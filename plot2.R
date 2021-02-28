## Plot 2

source("load-dataset.R")

png(filename = "plot2.png", height=480, width=480)
plot(sub_power$Global_active_power~sub_power$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
