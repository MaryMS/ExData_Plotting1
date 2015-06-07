#---------- Course Project 1 - Exploratory Data Analysis ----------#
#-------------------------- Plot 1 --------------------------------#

# Reads the dataset household_power_consumption.txt.
hpc_total <- read.csv("./household_power_consumption.txt", header = T, sep = ";", na.strings=c("Not Available", "NA", "?"))

# Filters the period between 01/02/2007 and 02/02/2007 on Format: day/month/year).
hpc <- hpc_total[(as.Date(hpc_total$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(hpc_total$Date, "%d/%m/%Y") <= "2007-02-02"),]

#library(datasets)

# Opens the png graphics device.
png(filename="plot1.png", width=480, height=480)

# Creates the Histogram.
hist(as.numeric(hpc$Global_active_power), col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Closes the png device.
dev.off()