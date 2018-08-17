file<-read.csv("household_power_consumption.txt",header=T,sep=";")
file$Date <- as.Date(file$Date, format="%d/%m/%Y")
filefilter<-sqldf("select * from file where Date between '1/2/2007' and '2/2/2007' order by Date")
png("plot1.png", width=480, height=480)
filefilter$Global_active_power<-as.numeric(filefilter$Global_active_power)
hist(filefilter$Global_active_power, col="red", main="Global Active Power"
)
##, xlab="Global Active Power (kilowatts)")
dev.off()