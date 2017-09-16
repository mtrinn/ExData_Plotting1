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



# plot 3: 

png(filename="plot3.png",width = 480, height = 480)

plot(powertest$Time, powertest$Sub_metering_1,type='l',xlab="",ylab="Energy Sub Metering")

lines(powertest$Time,powertest$Sub_metering_2, type="l",col="red")

lines(powertest$Time,powertest$Sub_metering_3, type="l",col="blue")

legend('topright', legend=c("Sub metering 1","Sub metering 2", "Sub metering 3"), col=c("black","red","blue"),lty=1,bty='n',cex=1)

dev.off()