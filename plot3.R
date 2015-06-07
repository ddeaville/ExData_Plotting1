
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


smalldata$Sub_metering_1 <- as.numeric(as.character(smalldata$Sub_metering_1))
smalldata$Sub_metering_2 <- as.numeric(as.character(smalldata$Sub_metering_2))

with(smalldata, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



dev.copy(png, file="plot3.png")
dev.off()
