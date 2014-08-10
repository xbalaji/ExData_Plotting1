
# program to generate the plot 'plot 2'

# check if "data.table" package exists, if not install it first
if ( !("data.table" %in% rownames(installed.packages()))) {
    install.packages("data.table")
} else {
    message(" data.table package is already installed")
}
library(data.table)



fileName <- "./household_power_consumption.txt"
zFile <- "./exdata_data_household_power_consumption.zip"
unzFile <- "exdata_data_household_power_consumption/household_power_consumption.txt"
unzFile <- "household_power_consumption.txt"


setClass("myDate")
setClass("myTime")
setClass("myDateTime")

setAs("character", "myDate", function(from) as.Date(from, format="%m/%d/%Y"))
setAs("character", "myTime", function(from) as.Date(strptime(from, format="%H:%M:%S")))
setAs("character", "myDateTime", function(from) as.Date(strptime(from, format="%d/%m/%Y %H:%M:%S")))


# strptime(pwr.table[2,2,with=F], format="%H:%M:%S")
# myCols <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

myCols <- c("myDate", "myTime", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")


# read the downloaded file
pwr.tb1 <- fread(unzFile, colClasses=myCols, header=T, na.strings=c("?"), skip=66630, nrows=3900)
# pwr.tb1 <- fread(unzFile, colClasses=myCols, header=T, na.strings=c("?"), skip=70000, nrows=100)

pwr.tb2 <- subset(pwr.tb1, Date >= "1/2/2007" && Date <= "2/2/2007") 

browser()
