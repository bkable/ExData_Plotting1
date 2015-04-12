source("./loadDataSet.R")
source("./getSubMeteringLegendCoord.R")

dataSet <- getDataSet()
legendCoord <- getSubMeteringLegendCoord(dataSet,0.6,0.75)

with(dataSet, {
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
})

legend("topright",
       col = c("black","red","blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       text.width = 50000,
       lty = 1,
       cex = legendCoord[3]
)

dev.copy(png,"./plot3.png", width=480, height=480)
dev.off()  
