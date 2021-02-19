library(ggplot2)
initial<-read.table("household_power_consumption.txt", header=TRUE,sep=";", nrows=5)
data <- read.table("household_power_consumption.txt", header=TRUE,sep=";", skip=66630, 
                   nrows=2900, col.names=names(initial), na.strings=c("?"),
                   colClasses=c("character", "character","numeric","numeric","numeric","numeric",
                                "numeric","numeric","numeric"))

data$Date<-as.Date(data$Date, format = "%d/%m/%Y")
data$Time<-strptime(paste(data$Date,data$Time),"%F %T")

data<-subset(data,data$Date %in% as.Date(c("2007-02-01","2007-02-02")))


png("plot2.png", width=480, height=480)
plot(data$Time,data$Global_active_power, ylab="Global Active Power (kilowatts)", 
     xlab="", pch =".", type="l")
dev.off()
