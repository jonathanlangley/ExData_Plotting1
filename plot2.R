#Entire Dataset
DataSet <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table(DataSet, header=T, sep=";", stringsAsFactors=F, na.strings="?", dec=".")

#Subset Data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, subSetData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#save to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()