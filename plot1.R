# Load the original data file
DATAFILE <- "exdata_data_household_power_consumption/household_power_consumption.txt"
df = read.table(DATAFILE, sep=";", header=TRUE, stringsAsFactors=FALSE, dec=".", na.strings="?")

# Extract entries within the given date range
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")
data <- subset(df, df$Date >= DATE1 & df$Date <= DATE2)

# Reformat columns
data$Global_active_power <- as.numeric(data$Global_active_power)
png("plot1.png", width=500, height=500)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()