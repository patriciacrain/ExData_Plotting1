## Read in the Electric Power Consumption dataset 
household <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
## Covert date formats from dd/mm/yyyy to R-friendly dates
household$Date <- as.Date(household$Date, format ="%d/%m/%Y") 
## Subseting the data to include only Feb 01 and Feb 02, 2007 
household  <- subset(household, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
## Converting Time to POSIX time
household$Time <- strptime(paste(household$Date,household$Time), "%Y-%m-%d %H:%M:%S")
## Plot a three time series to explore the data
png(filename="plot3.png", width=480, height =480)
plot(household$Time,household$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering" )
lines(household$Time,household$Sub_metering_2, type="l", col="red")
lines(household$Time,household$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()