#---------- Course Project 1 - Exploratory Data Analysis ----------#
#-------------------------- Plot 3 --------------------------------#

# Reads the dataset household_power_consumption.txt.
hpc_total <- read.csv("./household_power_consumption.txt", header = T, sep = ";", na.strings=c("Not Available", "NA", "?"))

# Filters the period between 01/02/2007 and 02/02/2007 on Format: day/month/year).
hpc <- hpc_total[(as.Date(hpc_total$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(hpc_total$Date, "%d/%m/%Y") <= "2007-02-02"),]

# Creates a new variable joining the variables Date and Time. Convert it to Date-Time class (POSIXct). 
hpc$date_time <-as.POSIXct(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

# Sets the setlocale("LC_TIME") to turns off locale-specific sorting. (My R is set to use: Portuguese_Brazil.1252).
Sys.setlocale("LC_TIME", "C")

# Open the png graphics device.
png(filename="plot4.png", width=480, height=480)

# Creates multiple base plots.
par(mfrow = c(2, 2))
with(hpc, {
  # First plot (line 1, column 1).
  plot(date_time, Global_active_power, type="l", xlab = "", ylab = "Global Active Power") 
  
  # Second plot (line 1, column 2).
  plot(date_time, Voltage, type="l", xlab = "datetime", ylab = "Voltage")
  
  # Third plot (line 2, column 1).
  plot(date_time, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
  lines(date_time, Sub_metering_2, col="red")
  lines(date_time, Sub_metering_3, col="blue")
  legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  # Fourth plot (line2, column 2).
  plot(date_time, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")
})

# Closes the png device.
dev.off()