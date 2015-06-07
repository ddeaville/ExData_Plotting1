
## Load the datatble
datatable <- read.table("household_power_consumption.txt", header = TRUE, sep =";")
dim(datatable)
names(datatable)

##Date Breakout by data
group1 <- datatable[which(datatable$Date == "1/2/2007") ,]
group2 <- datatable[which(datatable$Date == "2/2/2007") ,]
smalldata<- rbind(group1, group2)
smalldata$Global_active_power <-  as.numeric(as.character(smalldata$Global_active_power))

smalldata$datetime <- as.POSIXct(strptime(paste(smalldata$Date, smalldata$Time), "%d/%m/%Y %H:%M:%S", tz="GMT"))

#Generating Plot 1
plot(smalldata$datetime,smalldata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Generating Plot 2
plot(smalldata$datetime,smalldata$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Generating Plot 3
plot(smalldata$datetime,smalldata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(smalldata$datetime,smalldata$Sub_metering_2,col="red")
lines(smalldata$datetime,smalldata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)

#Generating Plot 4
plot(smalldata$datetime,smalldata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Saves data to file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()