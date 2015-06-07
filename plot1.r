data <- read.csv("household_power_consumption.txt", sep=";")
data$Date<-as.Date(data$Date, format= "%d/%m/%Y")
d1=as.Date("2007/2/1")
d2=as.Date("2007/2/2")
mydata<- subset(data, data$Date>=d1 & data$Date<=d2)
mydata$Global_active_power=as.numeric(levels(mydata$Global_active_power)[mydata$Global_active_power])                
png(filename = "plot1.png",  width = 480, height = 480)
hist(mydata$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power", ylim=c(0,1200))
dev.off()


