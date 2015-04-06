##plot 1
#reading in data
household_power_consumption <- read.csv(
        "C:/Users/user/Desktop/exdata-data-household_power_consumption/household_power_consumption.txt",
         sep=";", na.strings="?")

#keeping only the specified dates
data<-household_power_consumption[household_power_consumption$Date=="1/2/2007"|
                household_power_consumption$Date=="2/2/2007", ]



#plot graph
png(filename="plot1.png",width=480, height=480)

hist(data[,3], xlim=c(0,6), col="red", xlab=
             "Global Active Power (kilowats)", main="Global Active Power")

dev.off()
