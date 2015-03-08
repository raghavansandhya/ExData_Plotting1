plot1 <- function(file = "data/exdata-data-household_power_consumption/household_power_consumption.txt") {
	DT <- fread(file, na.strings="?")
	sub_DT <- DT[DT$Date == '1/2/2007' | DT$Date == '2/2/2007']
	png(file = "plot1.png")
	hist(as.numeric(sub_DT$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
	dev.off()
}
