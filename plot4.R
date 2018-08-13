# Exploratory_Data_Analysis
#Plot number 4.

##Load the data 
data <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?", dec=".")

##Formating the Date 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##Formatting the Time
data$Time <- as.POSIXct(data$Time, format = "%H:%M:%s")

##Subset Data to date ranges provided
data_subset <-subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

##Combining the Date and Time into a new column
data_subset$TS <- as.POSIXct(paste(data_subset$Date, data_subset$Time))


##Ploting the graph with dimensions 480 x 480 png
png("plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2))

with(data_subset, {plot(data_subset$Global_active_power~data_subset$TS, type = "l", ylab = "Global Active Power", xlab = "")
    plot(data_subset$Voltage~data_subset$TS, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(data_subset$Sub_metering_1~data_subset$TS, type = "l", ylab = "Energy sub metering", xlab = "")
    
        ##Using Lines for the plot
        lines(data_subset$TS, data_subset$Sub_metering_2, col = "red")
        lines(data_subset$TS, data_subset$Sub_metering_3, col = "blue")
        
        ##Putting up a legend
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"), bty="n")
    plot(data_subset$Global_reactive_power~data_subset$TS, type = "l", ylab = "Global_reactive_power", xlab = "datetime")  
  
  })

dev.off()
