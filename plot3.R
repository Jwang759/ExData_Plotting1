# read data and get subsets
## read data
setwd("C:/Users/Wang Jingyi/Desktop/Coursera/Exploratory Data Analysis/HW1")
library(data.table)
data <- fread("household_power_consumption.txt")
## change dates into numeric format
data$Date <- as.Date(data$Date,"%d/%m/%Y")
## subsetting 2007-02-01 to 2007-02-02 dataset
newdata <- subset(data,Date == "2007-02-01"|Date == "2007-02-02" )
Date2 <- format(newdata$Date,format="%a")
newdata = cbind(Date2, newdata)
## set "?" as NA value
newdata$Global_active_power <- as.numeric(newdata$Global_active_power)



# plot3: Energy sub metering-Date
## open device
png(filename = 'plot3.png', width = 480, height = 480, units='px')
## plot Global Active Power-Date
with(newdata,plot(Sub_metering_1, xaxt="n", xlab='', ylab = 'Energy sub metering',  type = 'l'))
with(newdata,lines(Sub_metering_2, col = 'red'))
with(newdata,lines(Sub_metering_3, col = 'blue'))
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
## close device
dev.off()