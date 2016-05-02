#set work directory
setwd('~/DataScienceCourse/04_Exploratory Data Analysis/PrAss_1')

#change system local
Sys.setlocale("LC_ALL","English")

# load data
source('get_clean_data.R')

#open device
png(filename='plot2.png',width=480,height=480,units='px')

#plot data
plot(clean_data$DateTime, clean_data$Global_active_power, xlab='', ylab='Global Active Power (kilowatts)', type='l' )

#close device
dev.off()
