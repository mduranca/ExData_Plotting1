## This script produces the plot 3 for the Course Project 2
## corresponding to Exploratory Data Analysis.

par(mar = c(6, 6, 4, 4))
with(EPCs, plot(EPCs$Date_Time,  EPCs$Sub_metering_1,  pch = NA,  
                xlab = "",  ylab =  "Energy sub metering"))
lines(EPCs$Date_Time,  EPCs$Sub_metering_1,  type = "l")
lines(EPCs$Date_Time,  EPCs$Sub_metering_2,  type = "l",  col = "red")
lines(EPCs$Date_Time,  EPCs$Sub_metering_3,  type = "l",  col = "blue")

legend("topright",  legend = c("Sub_metering_1    ", "Sub_metering_2    ", "Sub_metering_3    "),  pch = c(NA, NA, NA),  lwd = c(1, 1, 1),  lty = c(1, 1, 1),  
       col = c("black", "red", "blue")) 

dev.copy(png, file = "plot3.png");                                                                    
dev.off()
