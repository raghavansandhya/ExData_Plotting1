plot2 <- function(file = "data/exdata-data-household_power_consumption/household_power_consumption.txt") {
	DT <- fread(file, na.strings="?")
	sub_DT <- DT[DT$Date == '1/2/2007' | DT$Date == '2/2/2007']
	sub_DT[ ,ADate:= dmy(Date) + hms(Time)] 
	png(file = "plot2.png")
	plot(sub_DT$ADate,as.numeric(sub_DT$Global_active_power),type="l", xlab ="", ylab ="Global Active Power(kilowatts)")
	dev.off()
}
