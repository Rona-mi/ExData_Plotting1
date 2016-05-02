#set work directory
setwd('~/DataScienceCourse/04_Exploratory Data Analysis/PrAss_1')

#required packages
library(data.table)
library(lubridate)


dir_dest<-'data'
file_dest<-'data/household_power_consumption.txt'

#check if the data folder exists
if (!file.exists(dir_dest)) {
  dir.create(dir_dest)
}

#check if the data file exists (if not we need download and unzip)
if (!file.exists(file_dest)) {
  
  file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(file.url,destfile='data/exdata-data-household_power_consumption.zip')
  unzip('data/exdata-data-household_power_consumption.zip', exdir=dir_dest, overwrite=TRUE)
}
  
#read data with changing columns type
col.class<-c("character", "character", rep("numeric", 7))
power_consumption_data<-read.table(file_dest, header=TRUE,
                                sep=';',na.strings='?',colClasses=col.class)

#select required rows
selected_data<-power_consumption_data[power_consumption_data$Date=='1/2/2007' | power_consumption_data$Date=='2/2/2007',]
  
#convert and merge date/time fields
selected_data$DateTime<-dmy(selected_data$Date)+hms(selected_data$Time)
clean_data<-selected_data[,c(10,3:9)]

#write a clean data set to the directory  
write.table(clean_data,file='data/power_consumption_ready.txt',sep='|',row.names=FALSE)
  