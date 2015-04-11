source("./loadDataSet.R")

plot2 <- function(dataSet) {
        with(dataSet, plot(timestamp,
                           Global_active_power,
                           type = "l",
                           ylab = "Global Active Power (kilowatts)"),
             xlab = "")        
}

plot2(getDataSet())
dev.copy(png,"./plot2.png", width=480, height=480)
dev.off()
