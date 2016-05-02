#set work directory
setwd('~/DataScienceCourse/04_Exploratory Data Analysis/PrAss_1')

#change system local
Sys.setlocale("LC_ALL","English")

# load data
source('get_clean_data.R')

#open device
png(filename='plot1.png',width=480,height=480,units='px')

# plot data
hist(clean_data$Global_active_power, main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# close device
dev.off()