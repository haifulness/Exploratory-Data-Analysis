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
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)

# Plot
png("plot3.png", width=500, height=500)
plot(datetime, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering_2, type="l", col="red")
lines(datetime, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()