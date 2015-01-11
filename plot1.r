#plot 1



#read in the data file noting that empty fields have question marks and the separator between
#fields is a semi-colon
setwd("C:/Users/Susan/Documents/CourseraExploreData")
dat=read.table("./household/household_power_consumption.txt",na.strings="?",sep=";",header=TRUE)

# tell R that plots should be saved into a png file rather than
# plotted into a window
png("plot1.png",width=480,height=480)

#create new date field (myDate) to search on 
dat$myDate<-as.Date(dat$Date,format="%d/%m/%Y")

#subset the dat information into the desired date range
dateRange<-dat[(dat$myDate =="2007-02-01" | dat$myDate=="2007-02-02"),]

# Tell R there is only one plot 
par(mfrow=c(1,1))

# Plot a histogram
hist(dateRange$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()