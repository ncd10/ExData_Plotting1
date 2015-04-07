##plot 4
#reading in data
household_power_consumption <- read.csv(
        "C:/Users/user/Desktop/exdata-data-household_power_consumption/household_power_consumption.txt",        
        sep=";", na.strings="?")
#keeping only the specified dates
data<-household_power_consumption[household_power_consumption$Date=="1/2/2007"|
                                          household_power_consumption$Date=="2/2/2007", ]

#paste date and time
data$Date<-as.Date.character(data$Date, format="%d/%m/%Y")
data$day<-as.POSIXct(paste(data$Date, as.character(data$Time)))

#change language from Sys defult to English
Sys.setlocale("LC_TIME", "C")

##plot graph
png(filename="plot4.png",width=504, height=504,pointsize = 14)

#settings for multipule graphs
par(mfrow=c(2,2))
par(mar=c(4,4.5,2,2))

#graph 1
plot(data$day, data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

#graph 2
plot(data$day, data$Voltage, type="l", 
     ylab="Voltage", xlab="datetime")

#graph 3
plot(data$day, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
par(new=T)
lines(data$day, data$Sub_metering_2, col="red",ylim=c(0,30),xlab="",ylab="")
par(new=F)
lines(data$day, data$Sub_metering_3, col="blue",ylim=c(0,30),xlab="",ylab="") 
par(new=F)
legend('topright', c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col=c(1,2,4),lty=1, bty="n", pt.cex =2, cex=0.75)
#graph 4
plot(data$day, data$Global_reactive_power, type="l", 
     ylab= "Global reactive power" ,xlab="datetime")

dev.off()