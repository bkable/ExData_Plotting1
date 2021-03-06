source("./loadDataSet.R")

dataSet <- getDataSet()

with(dataSet, plot(datetime,
   Global_active_power,
   type = "l",
   ylab = "Global Active Power (kilowatts)",
   xlab = "")
)        

dev.copy(png,"./plot2.png", width=480, height=480)
dev.off()
