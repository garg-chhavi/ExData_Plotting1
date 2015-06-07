data <- read.csv("household_power_consumption.txt", sep=";")
data$Date<-as.Date(data$Date, format= "%d/%m/%Y")
d1=as.Date("2007/2/1")
d2=as.Date("2007/2/2")
mydata<- subset(data, data$Date>=d1 & data$Date<=d2)
mydata$Global_active_power=as.numeric(levels(mydata$Global_active_power)[mydata$Global_active_power])                
mydata$DateTime=strptime(paste(mydata$Date,mydata$Time),"%Y-%m-%d %H:%M:%S")
png(filename = "plot3.png",  width = 480, height = 480)
with(mydata, plot(DateTime, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering"))
lines(mydata$DateTime, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", pch="_", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
