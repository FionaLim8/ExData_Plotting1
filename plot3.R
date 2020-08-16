#open dplyr package
library(dplyr)

#Read data with separator
HhPower <- read.table("household_power_consumption.txt", sep = ";", 
                      na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

#read data for 1/2/2007 and 2/2/2007
hhp_date <- subset(HhPower, Date %in% c("1/2/2007","2/2/2007"))

#join Date and Time
hhp_datetime <- mutate(hhp_date, DateTime = paste(Date, Time, sep = " "))

#set to Date and Time format
hhp_datetime <- mutate(hhp_datetime, DateTime = strptime(DateTime, 
                format = "%d/%m/%Y %H:%M:%S"))

#save as png
png("plot3.png", width=480, height=480) 

#plot line graph
plot(hhp_datetime$DateTime, hhp_datetime$Sub_metering_1, 
     type = "l", xlab = "", ylab = "Energy sub metering")
lines(hhp_datetime$DateTime, hhp_datetime$Sub_metering_2, 
      type = "l", col = "red")
lines(hhp_datetime$DateTime, hhp_datetime$Sub_metering_3, 
      type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

#close
dev.off()