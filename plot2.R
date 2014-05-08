## Read in the Electric Power Consumption dataset 
household <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
## Covert date formats from dd/mm/yyyy to R-friendly dates
household$Date <- as.Date(household$Date, format ="%d/%m/%Y") 
## Subseting the data to include only Feb 01 and Feb 02, 2007 
household  <- subset(household, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
## Converting Time to POSIX time
household$Time <- strptime(paste(household$Date,household$Time), "%Y-%m-%d %H:%M:%S")
## Plot a time series to explore the data
png(filename="plot2.png", width=480, height =480)
plot(household$Time,household$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)" )
dev.off()
