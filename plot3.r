#plot3


#read in the data file noting that empty fields have question marks and the separator between
#fields is a semi-colon
setwd("C:/Users/Susan/Documents/CourseraExploreData")
dat=read.table("./household/household_power_consumption.txt",na.strings="?",sep=";",header=TRUE)

#create new date field (myDate) to search on 
dat$myDate<-as.Date(dat$Date,format="%d/%m/%Y")

#subset the dat information into the desired date range
dateRange<-dat[(dat$myDate =="2007-02-01" | dat$myDate=="2007-02-02"),]

#add a date and time field to plot time-series data
dateRange$DateTime <- as.POSIXct(strptime(paste(dateRange$Date,dateRange$Time), "%d/%m/%Y %H:%M:%S"))

# tell R that plots should be saved into a png file rather than
# plotted into a window
png("plot3.png",width=480,height=480)

# Tell R there is only one plot 
par(mfrow=c(1,1))

#create an x-y plot with sub meter 1
plot(dateRange$DateTime,dateRange$Sub_metering_1,type="l",
     xlab="",ylab="Energy Sub metering")
# add red data for sub meter 2
lines(dateRange$DateTime,dateRange$Sub_metering_2,col="red")
# add blue data for sub meter 3
lines(dateRange$DateTime,dateRange$Sub_metering_3,col="blue")
# add a legend in top right corner
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"))

#tell R to plot in windows again
dev.off()
