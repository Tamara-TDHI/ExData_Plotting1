## Plot4.R ready

## Choose your custom directory. If you don't, the program
## will run in your default location

##setwd("C:/Coursera/Exploratory Data Analysis/ExData_Plotting1")

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

png(filename = "plot4.png", units="px", width = 504, height = 504,
    bg = "transparent")

par (mfrow = c(2,2))

plot(EPC_subset$Date, EPC_subset$Global_active_power, type="l",ylab="Global Active Power", xlab="")

plot(EPC_subset$Date, EPC_subset$Voltage, type="l",ylab="Voltage", xlab="datetime")

plot(EPC_subset$Date, EPC_subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(EPC_subset$Date, EPC_subset$Sub_metering_2, type="l", col="red")
lines(EPC_subset$Date, EPC_subset$Sub_metering_3, type="l", col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       
       lty=c(1,1),
       
       bty='n',
       col=c("black","blue","red"))

plot(EPC_subset$Date, EPC_subset$Global_reactive_power, type="l",ylab="Global_reactive_power", 
     xlab="datetime")
dev.off()



