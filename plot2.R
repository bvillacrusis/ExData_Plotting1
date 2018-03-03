# Below R codes are used to generate plot2
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
png(filename = "./data/plot2.png")
plot(power_consumption$dateTime,power_consumption$Global_active_power, type ="l",
     col="black",  ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()





















