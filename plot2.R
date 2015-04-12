### Plot 2

##read data
data<-read.csv("household_power_consumption.txt", sep = ";",na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

##subset of data for plot
dataplot <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(dataplot$Date), dataplot$Time)
dataplot$Datetime <- as.POSIXct(datetime)

##plot in a file
png(filename = "plot2.png", width=480, height=480)
plot(dataplot$Global_active_power~dataplot$Datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()