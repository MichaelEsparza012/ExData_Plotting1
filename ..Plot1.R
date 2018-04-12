##MichaelEsparza012 - Course Project 1, Exploratory Data Analysis
## The following Code Loads the Data 
rm(list = ls())
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# As recommended, the date variable is converted to Date class, with the following code:
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# The following code subsets the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Once again, as recommended, the following code converts dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Plot 1 is developed with the following code
attach(data)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# The resultant plot is saved as a PNG file using the following code
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)
