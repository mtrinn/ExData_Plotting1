library(dplyr)
library(readr)

# reading the file 

power<-read_csv2("household_power_consumption.txt")

# conversion to Date Time format

power$Time=strptime(paste(power$Date,",",power$Time),format="%d/%m/%Y , %H:%M:%S")

# conversion to Date format

power$Date=as.Date(power$Date,format='%d/%m/%Y')


#select power data from 2007/2/1 to 2007/2/2

powertest=power[(power$Date>="2007-02-01")&(power$Date<="2007-02-02"),]

# plot 1: Global Active Power Density Distribution

png(filename="plot1.png",width = 480, height = 480)

hist(as.numeric(powertest$Global_active_power), main = "Global Active Power", xlab="Global Active Power (kilowatts)",col = "red")

dev.off()
