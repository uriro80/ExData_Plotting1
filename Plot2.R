# load packages
library(data.table)
library(lubridate)

# read the full data and tell the code "?" represents missing values.
data <- fread("./data/household_power_consumption.txt", na.strings = "?")

# subset relevant data between 2007-02-01 and 2007-02-02
data <- subset(data, data$Date %chin% c("1/2/2007", "2/2/2007")) 

# convert the Date and Time variables to Date/Time classes in R using the `dmy and hms`functions in lubridate package.
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

# plot to PNG device with the default width of 480 pixels and a height of 480 pixels
plot.new()
png("plot2.png")
with(data, plot(Global_active_power, type="l", ylab = "Global Active Power (Kilowatts)", xaxt = "n", xlab = ""))
with(data, axis(side = 1, at = c(1, length(Global_active_power)/2, length(Global_active_power)), labels = c("Thu", "Fri", "Sat")))
dev.off()