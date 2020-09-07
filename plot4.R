# Load the original data file
DATAFILE <- "exdata_data_household_power_consumption/household_power_consumption.txt"
df = read.table(DATAFILE, sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".", na.strings="?")

# Extract entries within the given date range
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
data <- subset(df, df$Date >= DATE1 & df$Date <= DATE2)

# Reformat columns
global_active_power <- as.numeric(data$Global_active_power)
global_reactive_power <- as.numeric(data$Global_reactive_power)
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)
voltage <- as.numeric(subSetData$Voltage)

# Plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()