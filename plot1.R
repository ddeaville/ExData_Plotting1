
## Load the datatble
datatable <- read.table("household_power_consumption.txt", header = TRUE, sep =";")
dim(datatable)
names(datatable)

##Date Breakout by data
group1 <- datatable[which(datatable$Date == "1/2/2007") ,]
group2 <- datatable[which(datatable$Date == "2/2/2007") ,]
smalldata<- rbind(group1, group2)
smalldata$Global_active_power <-  as.numeric(as.character(smalldata$Global_active_power))

create plot
names(smalldata)
hist(smalldata$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.copy(png, file = "plot1.png") 
dev.off() 


