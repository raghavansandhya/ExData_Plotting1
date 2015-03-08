plot3 <- function(file = "data/exdata-data-household_power_consumption/household_power_consumption.txt") {
	DT <- fread(file, na.strings="?")
	sub_DT <- DT[DT$Date == '1/2/2007' | DT$Date == '2/2/2007']
	sub_DT[ ,ADate:= dmy(Date) + hms(Time)] 
	png(file = "plot3.png")
	plot(sub_DT$ADate,as.numeric(sub_DT$Sub_metering_1),type="l", xlab ="", ylab ="Energy sub metering")
	lines(sub_DT$ADate,as.numeric(sub_DT$Sub_metering_2),col="red")
	lines(sub_DT$ADate,as.numeric(sub_DT$Sub_metering_3),col="blue")
	legend("topright",lty = 1,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	dev.off()
}
