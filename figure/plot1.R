# Set working directory
setwd("~/Documents/Coursera/ExploritoryDataAnalysis")

# Read data from text file
data<-read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE)

# Convert Date column to date
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

# Only keep data from 1st and 2nd of February 2007 
data<-data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]


# Make and save plot 1
png("plot1.png",width=480,height=480)
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.off()