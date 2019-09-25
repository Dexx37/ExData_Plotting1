## Read full data
full_energy <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, comment.char="", quote='\"')
full_energy$Date <- as.Date(full_energy$Date, format="%d/%m/%Y")

## Subsetting the data
energy<-subset(full_energy, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_energy)

## Converting dates
energytime <- paste(as.Date(energy$Date), energy$Time)
energy$Datetime <- as.POSIXct(energytime)

## Make Plot 1
hist(energy$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()