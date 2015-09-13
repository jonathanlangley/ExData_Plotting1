#Entire Dataset
DataSet <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.table(DataSet, header=T, sep=";", stringsAsFactors=F, na.strings="?", dec=".")

#Subset Data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot
hist(subSetData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()