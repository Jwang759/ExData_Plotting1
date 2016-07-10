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



# plot2: Global Active Power-Date
## open device
png(filename = 'plot2.png', width = 480, height = 480, units='px')
## plot Global Active Power-Date
with(newdata,plot(Global_active_power, xaxt="n", xlab = '', ylab = 'Global Active Power (kilowatt)',  type = 'l'))
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))
## close device
dev.off()
