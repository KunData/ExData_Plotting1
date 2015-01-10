## Read the specified rows in 'household_power_consumption.txt' into 'dat'
## with the header row skipped
dat <- read.table("./household_power_consumption.txt", sep = ';', 
					nrows = 2880, skip = 66637)
					
## Rename each column in 'dat'					
colnames(dat) <- c("Date", "Time", "Global_active_power",
					"Global_reactive_power", "Voltage",
					"Global_intensity", "Sub_metering_1",
					"Sub_metering_2", "Sub_metering_3")

						
## Open PNG device; create 'plot3.png' in the working directory					
png(file = "./plot3.png", width = 480, height = 480, units = "px")

## Create time-series objects with last three columns in 'dat'
sub1.ts <- ts(dat$Sub_metering_1)
sub2.ts <- ts(dat$Sub_metering_2)
sub3.ts <- ts(dat$Sub_metering_3)

## Create plot3 and send to the above file
par(cex.lab = 1.3, font.lab = "2")
ts.plot(sub1.ts, sub2.ts, sub3.ts, col = c(1, 2, 4), lty = 1, 
		gpars = list(xaxt = "n", xlab = "", ylab = "Energy sub metering"))			
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"), font = 2)
axis(2, font = 2)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		col = c(1, 2, 4), lty = 1)

##Close the PNG device
dev.off()	

	