
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

smalldata$Global_active_power <- as.numeric(as.character(smalldata$Global_active_power))


plot( smalldata$Global_active_power ~ smalldata$datetime, type="l", 
      xlab="", ylab="Global Active Power (kilowatts)", col="blue")

dev.copy(png, file="plot2.png")
dev.off()