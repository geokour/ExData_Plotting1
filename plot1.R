# Read in data
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Combine Date and Time columns into a single datetime column
mydata$datetime <- as.POSIXct(paste(mydata$Date, mydata$Time), format = "%d/%m/%Y %H:%M:%S")

# Convert datetime column to Date object
mydata$Date <- as.Date(mydata$datetime)

# Subset data to include only dates from 2007-02-01 and 2007-02-02
mydata_sub <- subset(mydata, Date >= "2007-02-01" & Date <= "2007-02-02")

# Convert columns to appropriate data types
mydata_sub$Global_active_power <- as.numeric(mydata_sub$Global_active_power)
mydata_sub$Global_reactive_power <- as.numeric(mydata_sub$Global_reactive_power)
mydata_sub$Voltage <- as.numeric(mydata_sub$Voltage)
mydata_sub$Global_intensity <- as.numeric(mydata_sub$Global_intensity)
mydata_sub$Sub_metering_1 <- as.integer(mydata_sub$Sub_metering_1)
mydata_sub$Sub_metering_2 <- as.integer(mydata_sub$Sub_metering_2)
mydata_sub$Sub_metering_3 <- as.integer(mydata_sub$Sub_metering_3)


# Plot 1

hist(mydata_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)")

# Open PNG graphics device
png("plot1.png")

# Generate histogram plot
hist(mydata_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)")

# Close graphics device
dev.off()
