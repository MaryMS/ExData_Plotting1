#---------- Course Project 1 - Exploratory Data Analysis ----------#
#-------------------------- Plot 2 --------------------------------#

# Reads the dataset household_power_consumption.txt.
hpc_total <- read.csv("./household_power_consumption.txt", header = T, sep = ";", na.strings=c("Not Available", "NA", "?"))

# Filters the period between 01/02/2007 and 02/02/2007 on Format: day/month/year).
hpc <- hpc_total[(as.Date(hpc_total$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(hpc_total$Date, "%d/%m/%Y") <= "2007-02-02"),]

# Creates a new variable joining the variables Date and Time. Convert it to Date-Time class (POSIXct). 
hpc$date_time <-as.POSIXct(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

# Sets the setlocale("LC_TIME") to turns off locale-specific sorting. (My R is set to use: Portuguese_Brazil.1252).
Sys.setlocale("LC_TIME", "C")

# Open the png graphics device.
png(filename="plot2.png", width=480, height=480)

# Creates the scatterplot.
plot(hpc$date_time, hpc$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Closes the png device.
dev.off()