##
##

EPC1 <- read.table("household_power_consumption.txt",  nrow = 1)
## EPC1[1]
##   V1
## 1 Date;Time;Global_active_power;Global_reactive_power;Voltage; Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3

EPC1 <- read.table("household_power_consumption.txt",  nrow = 1,  sep = ";")
## ncol(EPC1)
## [1] 9

Lines <- readLines("household_power_consumption.txt")
subset <- grep("^[1:2]/2/2007",  Lines)  ## dataset do not use the format 01 or 02.
EPCs <- read.table("household_power_consumption.txt",  skip =  subset[1] - 1,  nrow = length(subset) + 1,  sep = ";")

## head(EPCs)
##          V1       V2    V3    V4     V5  V6    V7   V8    V9
##  1 1/2/2007 00:00:00 0.326 0.128 243.15 1.4     0    0     0
##  2 1/2/2007 00:01:00 0.326 0.130 243.32 1.4     0    0     0
##  3 1/2/2007 00:02:00 0.324 0.132 243.51 1.4     0    0     0
##  4 1/2/2007 00:03:00 0.324 0.134 243.90 1.4     0    0     0
##  5 1/2/2007 00:04:00 0.322 0.130 243.16 1.4     0    0     0
##  6 1/2/2007 00:05:00 0.320 0.126 242.29 1.4     0    0     0

## tail(EPCs)
##            V1       V2    V3    V4     V5   V6   V7   V8   V9
## 2876 2/2/2007 23:55:00 3.696 0.226 240.90 15.2    0    1   18
## 2877 2/2/2007 23:56:00 3.698 0.226 241.02 15.2    0    2   18
## 2878 2/2/2007 23:57:00 3.684 0.224 240.48 15.2    0    1   18
## 2879 2/2/2007 23:58:00 3.658 0.220 239.61 15.2    0    1   17
## 2880 2/2/2007 23:59:00 3.680 0.224 240.37 15.2    0    2   18
## 2881 3/2/2007 00:00:00 3.614 0.106 240.99 15.0    0    1   18

new.names <- as.vector(t(EPC1[1,]))   ## t() converts the data frame in a matrix.
## new.names
## [1] "Date"   "Time"   "Global_active_power"   "Global_reactive_power"   "Voltage"               
## [6] "Global_intensity"   "Sub_metering_1"   "Sub_metering_2"   "Sub_metering_3"  

prefix <- "V"
suffix <- 1:9
my.names <- paste(prefix, suffix, sep = "")

setnames(EPCs,  my.names,  new.names)

## head(EPCs, n=2)
##       Date               Time  Global_active_power  Global_reactive_power   Voltage 
## 1 1/2/2007           00:00:00                0.326                  0.128    243.15              
## 2 1/2/2007           00:01:00                0.326                  0.130    243.32              
## Global_intensity    Sub_metering_1   Sub_metering_2   Sub_metering_3
##              1.4                 0                0                0
##              1.4                 0                0                0

EPCs$Date <- as.Date(EPCs$Date, "%d/%m/%Y")
## head(EPCs$Date)
## [1] "2007-02-01" "2007-02-01" "2007-02-01" "2007-02-01" "2007-02-01" "2007-02-01"

DateTime <- character()
for(i in 1:nrow(EPCs))  {
    DateTime[i] = paste(EPCs$Date[i],  EPCs$Time[i],  sep = " ")
}

EPCs$Date <- DateTime
setnames(EPCs, "Date", "Date_Time")
EPCs$Date_Time <- strptime(EPCs$Date_Time, "%Y-%m-%d %H:%M:%S")
