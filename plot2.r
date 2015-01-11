#plot2


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
png("plot2.png",width=480,height=480)

# Tell R there is only one plot 
par(mfrow=c(1,1))

#create a x-y plot of times-series data
plot(dateRange$DateTime,dateRange$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")
dev.off()