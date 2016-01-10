
source("load_data.R")

png(filename = "plot2.png")
plot(data$Time, data$Global_active_power, type="l", col="black", lwd=1.5,
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
