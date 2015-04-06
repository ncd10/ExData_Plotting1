
##plot 2
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
png(filename="plot2.png",width=480, height=480)

plot(data$day, data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
