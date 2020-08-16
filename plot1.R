#Read data with separator
HhPower <- read.table("household_power_consumption.txt", sep = ";", 
                      na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

#read data for 1/2/2007 and 2/2/2007
hhp_date <- subset(HhPower, Date %in% c("1/2/2007","2/2/2007"))

#save as png
png("plot1.png", width=480, height=480)                  

#Plot histogram
hist(hhp_date$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     xlim = c(0,6), ylim = c(0,1200), xaxt = "none",
     main = "Global Active Power")

axis(1, seq(0,6,2))

#close
dev.off()