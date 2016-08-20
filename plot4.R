## This script produces the plot 4 for the Course Project 2
## corresponding to Exploratory Data Analysis.

par(mfrow = c(2, 2),  mar = c(4, 4, 4, 2),  oma = c(2, 2, 0, 0))   

with(EPCs, plot(EPCs$Date_Time,  EPCs$Global_active_power,  pch = NA,  
                xlab = "",  ylab =  "Global Active Power"))
lines(EPCs$Date_Time,  EPCs$Global_active_power,  type = "l")

with(EPCs, plot(EPCs$Date_Time,  EPCs$Voltage,  pch = NA,  
                xlab = "datetime",  ylab =  "Voltage"))
lines(EPCs$Date_Time,  EPCs$Voltage,  type = "l")

with(EPCs, plot(EPCs$Date_Time,  EPCs$Sub_metering_1,  pch = NA,  
                xlab = "",  ylab =  "Energy sub metering"))
lines(EPCs$Date_Time,  EPCs$Sub_metering_1,  type = "l")
lines(EPCs$Date_Time,  EPCs$Sub_metering_2,  type = "l",  col = "red")
lines(EPCs$Date_Time,  EPCs$Sub_metering_3,  type = "l",  col = "blue")
legend("topright",  legend = c("Sub_metering_1    ", "Sub_metering_2    ", "Sub_metering_3    "),  pch = c(NA, NA, NA),  lwd = c(1, 1, 1),  lty = c(1, 1, 1),  
       col = c("black", "red", "blue"),  bty = "n")    ## bty="n" eliminates the legend's box.

with(EPCs, plot(EPCs$Date_Time,  EPCs$Global_reactive_power,  pch = NA,  
                xlab = "datetime",  ylab =  "Global_reactive_power"))
lines(EPCs$Date_Time,  EPCs$Global_reactive_power,  type = "l")

dev.copy(png, file = "plot4.png");                                                                    
dev.off()
