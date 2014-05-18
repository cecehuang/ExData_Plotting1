Sys.setlocale("LC_TIME", 'English')
table <- read.table("work/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
table2007 <- subset(table,Date == "2/2/2007" | Date == "1/2/2007" )
table2007$nd <- as.Date(as.character(table2007$Date),"%d/%m/%Y")
table2007$ndd <- paste(table2007[,"nd"],table2007[,"Time"],sep=".")
table2007$nddd <- strptime(table2007$ndd, "%Y-%m-%d.%H:%M:%S")
png('test.png',width = 480, height = 480, units = "px")

par(mfcol = c(2, 2)) 
plot(table2007$nddd,table2007$Global_active_power,type="l",ylab="Global_active_power(kilowatts)",xlab="",main="")

plot(table2007$nddd,table2007$Sub_metering_1,type="l",ylab="Sub_metering",xlab="",main="")
lines(table2007$nddd,table2007$Sub_metering_2,type="l",ylab="Sub_metering",xlab="",main="",col="red")
lines(table2007$nddd,table2007$Sub_metering_3,type="l",ylab="Sub_metering",xlab="",main="",col="blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(table2007$nddd,table2007$Voltage,type="l",ylab="Voltage",xlab="datetime",main="")

plot(table2007$nddd,table2007$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",main="")


dev.off()