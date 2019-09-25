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

## Make Plot 2
plot(energy$Global_active_power~energy$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()