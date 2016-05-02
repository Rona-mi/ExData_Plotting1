#set work directory
setwd('~/DataScienceCourse/04_Exploratory Data Analysis/PrAss_1')

#change system local
Sys.setlocale("LC_ALL","English")

# load data
source('get_clean_data.R')

#open device
png(filename='plot3.png',width=480,height=480,units='px')

#plot data
with(clean_data, plot(DateTime, Sub_metering_1,type='l',col='black', xlab='', ylab='Energy sub metering' ))
with(clean_data, lines(DateTime, Sub_metering_2,col='red'))
with(clean_data, lines(DateTime, Sub_metering_3,col='blue'))

#add legend
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') , col=c('black', 'red', 'blue'), lty='solid')

#Close device
dev.off()