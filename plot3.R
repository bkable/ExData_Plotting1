source("./loadDataSet.R")

dataSet <- getDataSet()

with(dataSet, plot(timestamp,
                   Sub_metering_1,
                   type = "l",
                   ylab = "Energy sub metering",
                   xlab = "",
                   col = "black"))

with(dataSet, points(timestamp,
                   Sub_metering_2,
                   type = "l",
                   col = "red"))

with(dataSet, points(timestamp,
                     Sub_metering_3,
                     type = "l",
                     col = "blue"))

# TODO: Legend still need formatting
legend("topright", pch = 1, 
       col = c("black","red","blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
                lty = 1,
                text.width = 75000
                )

dev.copy(png,"./plot3.png")
dev.off()
