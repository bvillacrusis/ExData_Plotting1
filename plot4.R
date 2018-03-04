# Below R codes are used to generate plot4
# It assumes that the data set is loacated under data directory. 
# The data folder is in the working directory.

# setting the rows to be read from the data set
skipRows <- 66636
numRows <- 2880

# reading the data set and saving it to data frame
power_consumption <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";",
                                skip = skipRows, nrow = numRows)

# setting column names of the data frame
colnames(power_consumption) <-  c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# adding new column which combines Date and Time variables
# the newly added column is of class Date
power_consumption <- transform(power_consumption, dateTime=strptime(paste(Date,Time,sep=" "), "%d/%m/%Y %H:%M:%S"))

# generating plot1.png and saves it to
# data directory
png(filename = "./data/plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
#plot 1
plot(power_consumption$dateTime,power_consumption$Global_active_power, type ="l",
     col="black",  ylab = "Global Active Power (kilowatts)", xlab="")

#plot 2
plot(power_consumption$dateTime,power_consumption$Voltage, type ="l",
     col="black",  ylab = "Voltage", xlab="datetime")
#plot 3
plot(power_consumption$dateTime,power_consumption$Sub_metering_1, type ="l",
     ylab = "Energy Sub Metering", xlab="")
matlines(data.matrix(power_consumption$dateTime),data.matrix(power_consumption$Sub_metering_2),type="l",col="red")
matlines(data.matrix(power_consumption$dateTime),data.matrix(power_consumption$Sub_metering_3),type="l", col="blue")
legend("topright", col = c("black","red","blue"), legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty = "n")

#plot 4
plot(power_consumption$dateTime,power_consumption$Global_reactive_power, type ="l",
     col="black",  ylab = "Global_Reactive_Power", xlab="datetime")


dev.off()





















