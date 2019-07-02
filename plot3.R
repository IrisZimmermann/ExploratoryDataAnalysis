library(dplyr)
library(data.table)

# Conversion of dates and times to a datetime object 
# strptime() and as.Date()
# Missing values are coded as ?


# Reading needed data from txt file
#==================================
data_pc <- fread("./household_power_consumption.txt", na.strings = "?")
data_pc[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

subset_pc<-filter(data_pc, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime <= as.Date("2007-02-02 00:00:00"))
subset_pc$DateTime <- as.POSIXct(paste(subset_pc$Date, subset_pc$Time), format="%d/%m/%Y %H:%M:%S")


# Create png plot and save histogram
#===================================
png(file="plot3.png", width=480, height=480) 
plot(subset_pc$DateTime,subset_pc$Sub_metering_1,type = "n", ylab="Energy sub metering", xlab="")
lines(subset_pc$DateTime,subset_pc$Sub_metering_1, col = "black", lwd = 2)
lines(subset_pc$DateTime,subset_pc$Sub_metering_2, col = "red", lwd = 2)
lines(subset_pc$DateTime,subset_pc$Sub_metering_3, col = "blue", lwd = 2)

legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) # adds legend
dev.off()


