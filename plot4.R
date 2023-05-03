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

#Plot 4
# Set up a 2x2 grid of plots
par(mfrow = c(2, 2))

# Plot 1: S type line plot of global active power vs. day
plot(mydata_sub$datetime, mydata_sub$Global_active_power, type = "n", xlab = " ", ylab = "Global active power")
lines(mydata_sub$datetime, mydata_sub$Global_active_power, col = "black")

# Plot 2: S type line plot of voltage vs. datetime
plot(mydata_sub$datetime, mydata_sub$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(mydata_sub$datetime, mydata_sub$Voltage, col = "black")

# Plot 3: S type line plot of submetering levels
plot(mydata_sub$datetime, mydata_sub$Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering")
lines(mydata_sub$datetime, mydata_sub$Sub_metering_1, col = "black")
lines(mydata_sub$datetime, mydata_sub$Sub_metering_2, col = "red")
lines(mydata_sub$datetime, mydata_sub$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# Plot 4: S type line plot of global reactive power vs. datetime
plot(mydata_sub$datetime, mydata_sub$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(mydata_sub$datetime, mydata_sub$Global_reactive_power, col = "black")

# Export plot 4

# Open PNG graphics device
png("plot4.png")

# Generate plot
par(mfrow = c(2, 2))
plot(mydata_sub$datetime, mydata_sub$Global_active_power, type = "n", xlab = " ", ylab = "Global active power")
lines(mydata_sub$datetime, mydata_sub$Global_active_power, col = "black")
plot(mydata_sub$datetime, mydata_sub$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(mydata_sub$datetime, mydata_sub$Voltage, col = "black")
plot(mydata_sub$datetime, mydata_sub$Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering")
lines(mydata_sub$datetime, mydata_sub$Sub_metering_1, col = "black")
lines(mydata_sub$datetime, mydata_sub$Sub_metering_2, col = "red")
lines(mydata_sub$datetime, mydata_sub$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
plot(mydata_sub$datetime, mydata_sub$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(mydata_sub$datetime, mydata_sub$Global_reactive_power, col = "black")

# Close graphics device
dev.off()
