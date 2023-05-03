# Read in data
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Combine Date and Time columns into a single datetime column
mydata$datetime <- as.POSIXct(paste(mydata$Date, mydata$Time), format = "%d/%m/%Y %H:%M:%S")

# Convert datetime column to Date object
mydata$Date <- as.Date(mydata$datetime)

# Subset data to include only dates from 2007-02-01 and 2007-02-02
mydata_sub <- subset(mydata, (Date >= "2007-02-01" & Date <= "2007-02-02") | (Date == "2007-02-03" & Time == "00:00:00"))

# Convert columns to appropriate data types
mydata_sub$Global_active_power <- as.numeric(mydata_sub$Global_active_power)
mydata_sub$Global_reactive_power <- as.numeric(mydata_sub$Global_reactive_power)
mydata_sub$Voltage <- as.numeric(mydata_sub$Voltage)
mydata_sub$Global_intensity <- as.numeric(mydata_sub$Global_intensity)
mydata_sub$Sub_metering_1 <- as.integer(mydata_sub$Sub_metering_1)
mydata_sub$Sub_metering_2 <- as.integer(mydata_sub$Sub_metering_2)
mydata_sub$Sub_metering_3 <- as.integer(mydata_sub$Sub_metering_3)


# Plot 3

# Create an empty plot with appropriate axes and labels
plot(mydata_sub$datetime, mydata_sub$Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering")

# Add lines to the plot representing each sub-metering data series
lines(mydata_sub$datetime, mydata_sub$Sub_metering_1, col = "black")
lines(mydata_sub$datetime, mydata_sub$Sub_metering_2, col = "red")
lines(mydata_sub$datetime, mydata_sub$Sub_metering_3, col = "blue")

# Add a legend to the plot in the top right corner
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# Open PNG graphics device
png("plot3.png")

# Generate plot
plot(mydata_sub$datetime, mydata_sub$Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering")
lines(mydata_sub$datetime, mydata_sub$Sub_metering_1, col = "black")
lines(mydata_sub$datetime, mydata_sub$Sub_metering_2, col = "red")
lines(mydata_sub$datetime, mydata_sub$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# Close graphics device
dev.off()