source("./loadDataSet.R")
source("./getSubMeteringLegendCoord.R")

## Plat4 is a 4 plot base plot with Global Active Power, Voltate, 
## Submetering, and Global Reactive Power

dataSet <- getDataSet()
legendCoord <- getSubMeteringLegendCoord(dataSet,0.4,0.75)

par(mfrow = c(2,2))
with(dataSet, {
        plot(datetime,
             Global_active_power,
             type = "l",
             ylab = "Global Active Power (kilowatts)",
             xlab = "")
        plot(datetime,
             Voltage,
             type = "l",
             xlab = "datetime")
        plot(datetime,
             Sub_metering_1,
             type = "l",
             ylab = "Energy sub metering",
             xlab = "",
             col = "black")
        points(datetime,
               Sub_metering_2,
               type = "l",
               col = "red")
        points(datetime,
               Sub_metering_3,
               type = "l",
               col = "blue")
        legend(legendCoord[1],
               legendCoord[2],
               col = c("black","red","blue"),
               legend = c("Sub_metering_1",
                          "Sub_metering_2",
                          "Sub_metering_3"),
               bty = "n",
               lty = 1,
               cex = legendCoord[3]
        )
        plot(datetime,
             Global_reactive_power,
             type = "l",
             xlab = "datetime")
        
})

dev.copy(png,"./plot4.png", width=480, height=480)
dev.off()  

