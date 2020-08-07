fulltable <- read.csv(file = "household_power_consumption.txt", sep= ";")
table <- subset(fulltable, Date == "1/2/2007" | Date == "2/2/2007")

datetimes <- strptime(paste(table[,"Date"],table[,"Time"]), 
                      format = c("%d/%m/%Y %H:%M:%S"))
table[,"Date_Time"] <- data.frame(datetimes)
png(file = "plot2.png")
plot(table$Date_Time,table$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active power (kilowatts)")
dev.off()