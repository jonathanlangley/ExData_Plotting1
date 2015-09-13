#Entire Dataset
DataSet <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table(DataSet, header=T, sep=";", stringsAsFactors=F, na.strings="?", dec=".")

#Subset Data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot
png("plot4.png", height=480, width=480)
par(mfrow = c(2, 2)) 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(datetime, subSetData$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(datetime, subSetData$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, 
     subSetData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subSetData$Sub_metering_2, type="l", col="red")
lines(datetime, subSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, 
       col=c("black", "red", "blue"))

plot(datetime, subSetData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#save to png
#dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()