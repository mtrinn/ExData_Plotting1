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



# plot 4: combine 4 plots

png(filename="plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))

hist(as.numeric(powertest$Global_active_power), main = "Global Active Power", xlab="Global Active Power (kilowatts)",col = "red")

plot(powertest$Time, powertest$Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)")

plot(powertest$Time, powertest$Sub_metering_1,type='l',xlab="",ylab="Energy Sub Metering")

lines(powertest$Time,powertest$Sub_metering_2, type="l",col="red")

lines(powertest$Time,powertest$Sub_metering_3, type="l",col="blue")

legend('topright', legend=c("Sub metering 1","Sub metering 2", "Sub metering 3"), col=c("black","red","blue"),lty=1,bty='n',cex=1)

plot(powertest$Time, powertest$Global_reactive_power,type='l',xlab="datetime",ylab="Global Active Power")

dev.off()