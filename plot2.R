## Read the specified rows in 'household_power_consumption.txt' into 'dat'
## with the header row skipped
dat <- read.table("./household_power_consumption.txt", sep = ';', 
					nrows = 2880, skip = 66637)
					
## Rename each column in 'dat'					
colnames(dat) <- c("Date", "Time", "Global_active_power",
					"Global_reactive_power", "Voltage",
					"Global_intensity", "Sub_metering_1",
					"Sub_metering_2", "Sub_metering_3")

						
## Open PNG device; create 'plot2.png' in the working directory					
png(file = "./plot2.png", width = 480, height = 480, units = "px")

## Create plot2 and send to the above file
with(dat, plot(Global_active_power, type = "l", xaxt = "n", xlab = "",
				ylab = "Global Active Power (kilowatts)", cex.lab = 1.3, font.lab = 2))
axis(side = 1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), font = 2)

##Close the PNG device
dev.off()	

	