### Plot 1

##read data
data<-read.csv("household_power_consumption.txt", sep = ";",na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

##subset of data for histogramm
datahist <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##plot in a file
png(filename = "plot1.png", width=480, height=480)
hist(datahist$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()