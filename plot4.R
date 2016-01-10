
source("load_data.R")

png(filename = "plot4.png")
par(mfrow=c(2,2))

plot(data$Time, data$Global_active_power, type="l", col="black", lwd=1.5,
     xlab = "", ylab = "Global Active Power")

plot(data$Time, data$Voltage, type="l", col="black", lwd=1.5, 
     xlab = "datetime", ylab = "Voltage")

plot(data$Time, data$Sub_metering_1, type="l", col="black", 
     xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, type="l", col="red")
lines(data$Time, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=2, col=c("black", "red", "blue"), bty = "n")

plot(data$Time, data$Global_reactive_power, type="l", col="black", lwd=1.5,
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
