
Sys.setlocale("LC_TIME", 'English')
table <- read.table("work/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
table2007 <- subset(table,Date == "2/2/2007" | Date == "1/2/2007" )
table2007$nd <- as.Date(as.character(table2007$Date),"%d/%m/%Y")
table2007$ndd <- paste(table2007[,"nd"],table2007[,"Time"],sep=".")
table2007$nddd <- strptime(table2007$ndd, "%Y-%m-%d.%H:%M:%S")
png('test.png',width = 480, height = 480, units = "px")

hist(table2007$Global_active_power,col="red",xlab="Global_active_power(kilowatts)",main = "Global_active_power",breaks=20)


dev.off()