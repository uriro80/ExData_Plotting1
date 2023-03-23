# load packages
library(data.table)
library(lubridate)
# file size estimation in Mb
filesize <- 8*2075259*9/10^6

# read the full data and tell the code "?" represents missing values.
data <- fread("./data/household_power_consumption.txt", na.strings = "?")

# subset relevant data between 2007-02-01 and 2007-02-02
data <- subset(data, data$Date %chin% c("1/2/2007", "2/2/2007")) 

# convert the Date and Time variables to Date/Time classes in R using the `dmy and hms`functions in lubridate package.
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

# plot the histogram to PNG device with the default width of 480 pixels and a height of 480 pixels
png("plot1.png")
with(data, hist(Global_active_power, col = "red", breaks = 12, xlab = "Global Active Power (Kilowatts)", main = "Global Active Power"))
dev.off()