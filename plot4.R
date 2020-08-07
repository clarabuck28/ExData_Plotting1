fulltable <- read.csv(file = "household_power_consumption.txt", sep= ";")
table <- subset(fulltable, Date == "1/2/2007" | Date == "2/2/2007")

datetimes <- strptime(paste(table[,"Date"],table[,"Time"]), 
                      format = c("%d/%m/%Y %H:%M:%S"))
table[,"Date_Time"] <- data.frame(datetimes)
png(file = "plot4.png")
par(mfrow = c(2,2))
#create first table
plot(table$Date_Time,table$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active power")
#create second table
plot(table$Date_Time,table$Voltage, type = "l", ylab = "Voltage",xlab = "Date/Time")
#create third table
with(table, plot(Date_Time,Sub_metering_1, type = "l", xlab = "",
                 ylab = "Energy sub metering"))
with(table, lines(Date_Time,Sub_metering_2, col = "red"))
with(table, lines(Date_Time,Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lty = "solid", cex = .8)
#create fourth table
plot(table$Date_Time,table$Global_reactive_power, type = "l", 
     ylab = "Global Reactive Power", xlab = "Date/Time")

dev.off()