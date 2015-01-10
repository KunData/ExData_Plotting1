## Read the specified rows in 'household_power_consumption.txt' into 'dat'
## with the header row skipped
dat <- read.table("./household_power_consumption.txt", sep = ';', 
					nrows = 2880, skip = 66637)
					
## Rename each column in 'dat'					
colnames(dat) <- c("Date", "Time", "Global_active_power",
					"Global_reactive_power", "Voltage",
					"Global_intensity", "Sub_metering_1",
					"Sub_metering_2", "Sub_metering_3")

						
## Open PNG device; create 'plot4.png' in the working directory					
png(file = "./plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2), mar = c(5, 5, 4, 1))
## Create subplot 'Global_active_power'
with(dat, plot(Global_active_power, type = "l", xaxt = "n", xlab = "",
				ylab = "Global Active Power", cex.lab = 1.1))
axis(side = 1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

## Create subplot 'Voltage'
with(dat, plot(Voltage, type = "l", xaxt = "n", xlab = "datetime",
				ylab = "Voltage", cex.lab = 1.1))
axis(side = 1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

## Create subplot 'Energy sub metering'
sub1.ts <- ts(dat$Sub_metering_1)
sub2.ts <- ts(dat$Sub_metering_2)
sub3.ts <- ts(dat$Sub_metering_3)
par(cex.lab = 1.1)
ts.plot(sub1.ts, sub2.ts, sub3.ts, col = c(1, 2, 4), lty = 1, 
		gpars = list(xaxt = "n", xlab = "", ylab = "Energy sub metering"))			
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
axis(2, font = 2)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		col = c(1, 2, 4), lty = 1, bty = "n")
		
## Create subplot 'Global_reactive_power'
with(dat, plot(Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime",
				yaxt = "n", ylab = "Global_reactive_power", cex.lab = 1.1))
axis(side = 1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
axis(side = 2, at = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))

##Close the PNG device
dev.off()	

	