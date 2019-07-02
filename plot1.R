library(dplyr)
library(data.table)

# Conversion of dates and times to a datetime object 
# strptime() and as.Date()
# Missing values are coded as ?

data_pc <- fread("./household_power_consumption.txt", na.strings = "?")
data_pc[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
subset_pc<-filter(data_pc, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime <= as.Date("2007-02-02 00:00:00"))
subset_pc$Time <- as.factor(subset_pc$Time)

png(file="plot1.png", width=480, height=480) 
hist(subset_pc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red",ylim=c(0,1201))
dev.off()


