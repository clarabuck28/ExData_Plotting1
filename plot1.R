fulltable <- read.csv(file = "household_power_consumption.txt", sep= ";")
table <- subset(fulltable, Date == "1/2/2007" | Date == "2/2/2007")
png(file = "plot1.png")
hist(as.numeric(table$Global_active_power), 
     xlab = "Global Active Power (kilowatts)" , 
     ylab = "Frequency", col = "red", main = "Global Active Power", 
     cex.lab = .8, cex.axis = .8)
dev.off()