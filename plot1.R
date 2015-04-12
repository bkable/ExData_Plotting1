source("./loadDataSet.R")

dataSet <- getDataSet()
x <- dataSet$Global_active_power

hist(x,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")        

dev.copy(png,"./plot1.png", width=480, height=480)
dev.off()
