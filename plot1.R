## plot1.R
# Summary: get the data if necessary
#     then
#     build the plot
# Note all code and data are for the current working directory
# This is my working directory, yours may be different, so I comment this out
#
setwd("~/coursera/ExploratoryDataAnalysis/project1")
#
# data is from this site: http://archive.ics.uci.edu/ml/
# data url is: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Data is txt file in a zip. The data is ; deliminated in 9 columns
# household_power_consumption.txt
# We will only be using data from the dates 2007-02-01 and 2007-02-02
#
# Get the txt file if necessary
mydatatxt <- "household_power_consumption.txt"

if (!file.exists(mydatatxt)) {
      dateDownloaded <- date()
      library(utils)
      fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      temp <- tempfile()
      download.file(fileurl,temp)
      # plotdata <- read.table(unz(temp, mydatatxt))
      unzip (temp)
      unlink(temp)
}
# print(list.files())
#
# read txt file into R, we will use only dates 2007-02-01 and 2007-02-02 only
#
#
pd <- read.table(mydatatxt, header = TRUE, sep=";", na.strings = c("?"), stringsAsFactors = FALSE)
pd$Date <- as.Date(pd$Date, "%d/%m/%Y")
# subset to desired date range
pds <- subset(pd, Date == "2007-02-01" | Date == "2007-02-02")
# add a datetime column
pds$datetime <- as.POSIXct(paste(pds$Date,pds$Time ))
# then add a day of week column
pds$day <- weekdays(as.Date(pds$Date))
#
#
png("plot1.png", width=480, height=480, units= "px")
hist(pds$Global_active_power, col = "red", main = "Global_active_power", xlab = "Global Active Power (kilowatts)")
dev.off()


# png("plot1.png",width=480,height=480,units="in",res=1200)
# par(mar=c(5,5,2,2),xaxs = "i",yaxs = "i",cex.axis=1.3,cex.lab=1.4)
# plot(perf,avg="vertical",spread.estimate="stddev",col="black",lty=3, lwd=3)
# dev.off()
# 
# x <- seq(0,2*pi,0.1)
# y <- sin(x)
# plot(x,
#      y,
#      main="main title", 
#      sub="sub-title", 
#      xlab="x-axis label", 
#      ylab="y-axis label")
# 
# 
# 
# 
