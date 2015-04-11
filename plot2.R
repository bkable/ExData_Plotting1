source("./loadDataSet.R")

dataSet <- getDataSet()

with(dataSet, plot(timestamp,
                   Global_active_power,
                   type = "l",
                   ylab = "Global Active Power (kilowatts"),
                   xlab = "")

dev.copy(png,"./plot2.png")
dev.off()
