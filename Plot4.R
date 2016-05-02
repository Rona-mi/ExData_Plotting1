#set work directory
setwd('~/DataScienceCourse/04_Exploratory Data Analysis/PrAss_1')

#change system local
Sys.setlocale("LC_ALL","English")

# load data
source('get_clean_data.R')

#open device
png(filename='plot4.png',width=480,height=480,units='px')

#change parameters - make 4 plots
par(mfrow=c(2,2))

#plot[1,1]
with(clean_data, plot(DateTime, Global_active_power, xlab='', ylab='Global Active Power', type='l'))

#plot[1,2]
with(clean_data, plot(DateTime, Voltage, xlab='datetime', type='l'))

#plot[2,1]
with(clean_data, plot(DateTime, Sub_metering_1,type='l',col='black', xlab='', ylab='Energy sub metering' ))
with(clean_data, lines(DateTime, Sub_metering_2,col='red'))
with(clean_data, lines(DateTime, Sub_metering_3,col='blue'))
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') , col=c('black', 'red', 'blue'), lty='solid')

#plot[2,2]
with(clean_data, plot(DateTime, Global_reactive_power, xlab='datetime', type='l'))

#close device
dev.off()
