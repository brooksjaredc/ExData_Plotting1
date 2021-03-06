# R code for creating plot3.png

# Reading in the data

energy_usage_full <- read.table("../week1/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# Subsetting for only those two days

energy_usage_small <- filter(energy_usage_full, Date=="1/2/2007" | Date=="2/2/2007")

# Transforming date and time character values into one "datetime" date value

datetime <- dmy_hms(paste(energy_usage_small[,1], energy_usage_small[,2]))
energy_usage_small <- cbind(datetime, energy_usage_small)
energy_usage_small <- select(energy_usage_small, datetime, contains("Global"), Voltage, contains("Sub"))

# Plotting

png("plot3.png", 480, 480)

with(energy_usage_small, plot(datetime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(energy_usage_small, lines(datetime, Sub_metering_2, type = "l", col = "red", xlab = "", ylab = ""))
with(energy_usage_small, lines(datetime, Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = ""))
legend("topright", lwd=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Closing

dev.off()
