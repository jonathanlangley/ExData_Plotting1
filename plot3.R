#Entire Dataset
DataSet <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table(DataSet, header=T, sep=";", stringsAsFactors=F, na.strings="?", dec=".")

#Subset Data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot
png("plot3.png", height=480, width=480)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, 
     subSetData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subSetData$Sub_metering_2, type="l", col="red")
lines(datetime, subSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, 
       col=c("black", "red", "blue"))

#save to png
#dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()