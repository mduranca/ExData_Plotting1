## This script produces the plot 2 for the Course Project 2
## corresponding to Exploratory Data Analysis.

par(mar = c(6, 6, 4, 4))
with(EPCs, plot(EPCs$Date_Time,  EPCs$Global_active_power,  pch = NA,  
                xlab = "",  ylab =  "Global Active Power (kilowatts)"))
lines(EPCs$Date_Time,  EPCs$Global_active_power,  type = "l")
     
dev.copy(png, file = "plot2.png");                                                                    
dev.off()
     