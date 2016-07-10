# read data and get subsets
## read data
setwd("C:/Users/Wang Jingyi/Desktop/Coursera/Exploratory Data Analysis/HW1")
library(data.table)
data <- fread("household_power_consumption.txt")
## change dates into numeric format
data$Date <- as.Date(data$Date,"%d/%m/%Y")
## subsetting 2007-02-01 to 2007-02-02 dataset
newdata <- subset(data,Date == "2007-02-01"|Date == "2007-02-02" )
## set "?" as NA value
newdata$Global_active_power <- as.numeric(newdata$Global_active_power)

# plot1: Histogram for Global Active Power
## open device
png(filename = 'plot1.png', width = 480, height = 480, units='px')
## plot histogram
with(newdata,hist(Global_active_power,xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
## close device
dev.off()


