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


# Make and save plot 2
png("plot2.png",width=480,height=480)
plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()