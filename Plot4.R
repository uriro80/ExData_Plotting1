# subset relevant data between 2007-02-01 and 2007-02-02
data <- subset(data, data$Date %chin% c("1/2/2007", "2/2/2007")) 

# convert the Date and Time variables to Date/Time classes in R using the `dmy and hms`functions in lubridate package.
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

## plot to PNG device with the default width of 480 pixels and a height of 480 pixels
# open new plot
plot.new()
# open a png device
png("plot4.png")
# start a sub plotting scheme
par(mfcol = c(2,2))#, mar = c())
# plot plot2
with(data, plot(Global_active_power, type="l", ylab = "Global Active Power (Kilowatts)", xaxt = "n", xlab = ""))
with(data, axis(side = 1, at = c(1, length(Global_active_power)/2, length(Global_active_power)), labels = c("Thu", "Fri", "Sat")))
# plot plot3
with(data, plot(Sub_metering_1, type="n", xaxt = "n", xlab = "", ylab = ""))
with(data, lines(Sub_metering_1, col = "black", xaxt = "n", xlab = "", ylab = ""))
with(data, lines(Sub_metering_2, col = "red", xaxt = "n", yaxt = "n", xlab = "", ylab = ""))
with(data, lines(Sub_metering_3, col = "blue", xaxt = "n", yaxt = "n", xlab = "", ylab = ""))
with(data, axis(side = 1, at = c(1, length(Global_active_power)/2, length(Global_active_power)), labels = c("Thu", "Fri", "Sat")))
legend("topright", lty = c(1,1,1) , col = c("black", "red", "blue") ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
title(ylab = "Energy sub metering")
# plot voltage
with(data, plot(Voltage, type="l", xlab = "datetime", ylab = "Voltage", xaxt = "n"))
with(data, axis(side = 1, at = c(1, length(Global_active_power)/2, length(Global_active_power)), labels = c("Thu", "Fri", "Sat")))
# plot Global_reactive_power
with(data, plot(Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n"))
with(data, axis(side = 1, at = c(1, length(Global_active_power)/2, length(Global_active_power)), labels = c("Thu", "Fri", "Sat")))
dev.off()