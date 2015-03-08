plot4 <- function(file = "data/exdata-data-household_power_consumption/household_power_consumption.txt") {
	DT <- fread(file, na.strings="?")
	sub_DT <- DT[DT$Date == '1/2/2007' | DT$Date == '2/2/2007']
	sub_DT[ ,ADate:= dmy(Date) + hms(Time)] 
	png(file = "plot4.png",type = "cairo-png")
	par( mfrow = c( 2, 2 ) )
	plot(sub_DT$ADate,as.numeric(sub_DT$Global_active_power),type="l", xlab ="", ylab ="Global Active Power")
	plot(sub_DT$ADate,as.numeric(sub_DT$Voltage),type="l",yaxt="n",xlab ="datetime", ylab ="Voltage")
	axis(2, at=c(236,240,244), label=c("","",""),lwd.ticks=1)
	axis(2, at=c(234,238,242,246),lwd.ticks=1)
	plot(sub_DT$ADate,as.numeric(sub_DT$Sub_metering_1),type="l", xlab ="", ylab ="Energy sub metering")
	lines(sub_DT$ADate,as.numeric(sub_DT$Sub_metering_2),col="red")
	lines(sub_DT$ADate,as.numeric(sub_DT$Sub_metering_3),col="blue")
	legend("topright",lty = 1,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	plot(sub_DT$ADate,as.numeric(sub_DT$Global_reactive_power),type="l",xlab ="datetime", ylab ="Global_reactive_power")
	dev.off()
}
