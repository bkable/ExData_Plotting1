## Legend positioning by topright location renders poorly
## Generate legend coordinate by max of dataset boundaries
getSubMeteringLegendCoord <- function(dataSet,offset,cex) {
        minTimeStamp <- as.numeric(min(dataSet$datetime))
        maxTimeStamp <- as.numeric(max(dataSet$datetime))
        
        xCoord <- ((maxDateTime - minDateTime)*offset) + minDateTime
        
        yCoord <- as.numeric(max(dataSet$Sub_metering_1))
        temp <- as.numeric(max(dataSet$Sub_metering_2))
        if (temp > yCoord) yCoord <- temp
        temp <- as.numeric(max(dataSet$Sub_metering_3))
        if (temp > yCoord) yCoord <- temp
        
        c(xCoord,yCoord,cex)
}
