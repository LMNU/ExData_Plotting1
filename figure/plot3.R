# Set working directory
setwd("~/Documents/Coursera/ExploritoryDataAnalysis")

# Read data from text file
data<-read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE)

# Convert Date column to date
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

# Only keep data from 1st and 2nd of February 2007 
data<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]

# Create DateTime column
data$DateTime<-as.character(paste(data$Date,data$Time,sep=" "))

# Convert DateTime column to dates and times
data$DateTime<-strptime(data$DateTime,format="%Y-%m-%d %H:%M:%S")


# Make and save plot 3
png("plot3.png",width=480,height=480)
plot(data$DateTime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,type="l",col="red")
lines(data$DateTime,data$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()