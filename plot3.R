### Plot 3

##read data
data<-read.csv("household_power_consumption.txt", sep = ";",na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

##subset of data for plot
dataplot <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(dataplot$Date), dataplot$Time)
dataplot$Datetime <- as.POSIXct(datetime)

##plot in a file
png(filename = "plot3.png", width=480, height=480)
with(dataplot, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()