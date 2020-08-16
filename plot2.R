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
png("plot2.png", width=480, height=480)

#Plot line graph
plot(hhp_datetime$DateTime, hhp_datetime$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#close
dev.off()