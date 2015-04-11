source("./loadDataSet.R")

plot1 <- function(dataSet) {
        x <- dataSet$Global_active_power
        
        hist(x,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")        
}

plot1(getDataSet())
dev.copy(png,"./plot1.png", width=480, height=480)
dev.off()
