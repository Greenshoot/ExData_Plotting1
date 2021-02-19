library(ggplot2)
initial<-read.table("household_power_consumption.txt", header=TRUE,sep=";", nrows=5)
data <- read.table("household_power_consumption.txt", header=TRUE,sep=";", skip=66630, 
                   nrows=2900, col.names=names(initial), na.strings=c("?"),
                   colClasses=c("character", "character","numeric","numeric","numeric","numeric",
                                "numeric","numeric","numeric"))

data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
data$Time<-strptime(paste(data$Date,data$Time),"%F %T")

data<-subset(data,data$Date %in% as.Date(c("2007-02-01","2007-02-02")))


png("plot3.png", width=480, height=480)
plot(data$Time,data$Sub_metering_1, ylab="Energy sub metering", 
     xlab="", pch =".", type="l")
points(data$Time,data$Sub_metering_2,col="red",type="l")
points(data$Time,data$Sub_metering_3,col="blue",type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(data[,7:9]))
dev.off()