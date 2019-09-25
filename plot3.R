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

## Make Plot 3
with(energy, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub metering")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()