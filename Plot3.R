##plot 3
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

#plot graph
png(filename="plot3.png",width=480, height=480)

plot(data$day, data$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab="" )
par(new=T)
lines(data$day, data$Sub_metering_2, type="l", col="red",
      ylim=c(0,30),xlab="",ylab="", mar=c(5, 4, 10, 2))
par(new=F)
lines(data$day, data$Sub_metering_3, type="l", col="blue",
      ylim=c(0,30),xlab="",ylab="", mar=c(5, 4, 10, 2)) 
par(new=F)
legend('topright', c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col=c(1,2,4),lty=1, cex=.8)

dev.off()