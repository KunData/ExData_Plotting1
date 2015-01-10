## Read the specified rows in 'household_power_consumption.txt' into 'dat'
## with the header row skipped
dat <- read.table("./household_power_consumption.txt", sep = ';', 
					nrows = 2880, skip = 66637)
					
## Rename each column in 'dat'					
colnames(dat) <- c("Date", "Time", "Global_active_power",
					"Global_reactive_power", "Voltage",
					"Global_intensity", "Sub_metering_1",
					"Sub_metering_2", "Sub_metering_3")
					

## Open PNG device; create 'plot1.png' in the working directory					
png(file = "./plot1.png", width = 480, height = 480, units = "px")

## Create plot1 and send to the above file
hist(dat$Global_active_power, col = 'red', 
			main = paste("Global Active Power"),
			xlab = ("Global Active Power (kilowatts)"))

##Close the PNG device
dev.off()	

	