## Plot1.R

## Choose your custom directory. If you don't, the program
## will run in your default location

## setwd("C:/Coursera/Exploratory Data Analysis")

if (!file.exists("data")) {
  dir.create("data") }

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/household_zip.zip")
list.files("./data")

household <- unz("./data/household_zip.zip", 'household_power_consumption.txt')
EPC <- read.table(household, header=TRUE, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
dim(EPC)
names(EPC)
class(EPC$Date)

EPC_subset <- subset(EPC, EPC$Date == "1/2/2007" | EPC$Date == "2/2/2007")
dim(EPC_subset)
str(EPC_subset)
head(EPC_subset)

class(EPC_subset$Global_active_power)


png(filename = "plot1.png", units="px", width = 480, height = 480,
    bg = "transparent")
hist(as.numeric(EPC_subset$Global_active_power), col="Red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
     )
dev.off()

