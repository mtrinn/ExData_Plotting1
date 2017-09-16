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



# plot 2: Global Active Power vs Time

png(filename="plot2.png",width = 480, height = 480)

plot(powertest$Time, powertest$Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)")

dev.off()