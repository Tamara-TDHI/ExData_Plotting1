## Plot2.R ready

## Choose your custom directory. If you don't, the program
## will run in your default location

## setwd("C:/Coursera/Exploratory Data Analysis/ExData_Plotting1")

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
names(EPC_subset)

EPC_subset$Date <- strptime(paste(EPC_subset$Date,EPC_subset$Time), "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")

png(filename = "plot2.png", units="px", width = 480, height = 480,
    bg = "transparent")
plot(EPC_subset$Date, EPC_subset$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()


