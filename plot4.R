source("./loadDataSet.R")

plot4 <- function(dataSet) {
        plot2(dataSet)
        voltagePlot(dataSet)
        plot3(dataSet)
        reactivePowerPlot(dataSet)
}

voltagePlot <- function(dataSet) {
        with(dataSet, plot(timestamp,
                           Voltage,
                           type = "l",
                           ylab = "Voltage",
                           xlab = "datetime"))    
}

reactivePowerPlot <- function(dataSet) {
        with(dataSet, plot(timestamp,
                           Global_reactive_power,
                           type = "l",
                           ylab = "Global_reactive_power",
                           xlab = "datetime"))   
}

plot4(getDataSet())
dev.copy(png,"./plot4.png", width=480, height=480)
dev.off()  