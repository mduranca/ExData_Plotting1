## This script produces the plot 1 for the Course Project 1 
## corresponding to Exploratory Data Analysis.

par(mar = c(6, 6, 4, 2));
hist(EPCs$Global_active_power,  col = "red",  main = "Global Active Power",  
     xlab = "Global Active Power (kilowatts)",  ylab = "Frequency")
                               
dev.copy(png, file = "plot1.png")                                                                    
dev.off() 
