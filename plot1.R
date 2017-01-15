# R code for creating plot1.png

# Reading in the data

energy_usage_full <- read.table("../week1/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# Subsetting for only those two days

energy_usage_small <- filter(energy_usage_full, Date=="1/2/2007" | Date=="2/2/2007")

# Transforming date and time character values into one "datetime" date value

datetime <- dmy_hms(paste(energy_usage_small[,1], energy_usage_small[,2]))
energy_usage_small <- cbind(datetime, energy_usage_small)
energy_usage_small <- select(energy_usage_small, datetime, contains("Global"), Voltage, contains("Sub"))

# Plotting

png("plot1.png", 480, 480)

hist(energy_usage_small$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Closing

dev.off()
