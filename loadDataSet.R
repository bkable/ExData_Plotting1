library(data.table)
library(plyr)
library(dplyr)

###################################################
##
## Load Data Set from Web Site or cached data files
##
###################################################

zipFileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- "./exdata-household-power-consumption.zip"
dataFile <- "./household_power_consumption.txt"
subsetDataFile <- "./subset_household_power_consumption.txt"
unixPlatform <- "unix"
dateTimeFormat <- "%d/%m/%Y %H:%M:%S"

housepwrDT <<- NULL

getDataSet <- function() {
        if(is.null(housepwrDT))
                housepwrDT <<- loadDataSet()
        
        housepwrDT
}

init <- function() {
        print("Initializing workspace")
        setwd("~/GitHub/ExData_Plotting1/")
}

cleanStagingFiles <- function() {
        if(file.exists(zipFile)) unlink(zipFile)
        if(file.exists(dataFile)) unlink(dataFile)
        cleanSubsetFile()
}

cleanSubsetFile <- function() {
        if(file.exists(subsetDataFile)) unlink(subsetDataFile)
}

loadDataSet <- function() {
        init()
        
        if(!file.exists(dataFile)) {
                if(!file.exists(zipFile)) {
                        print("Downloading Zip File")
                        download.file(zipFileUrl,zipFile,method = "curl")
                }
                
                print("Extracting Zip File")
                unzip(zipFile)        
        }
        
        print("Loading Data Table")

        housepwrDT <- fread(dataFile,sep = ";",skip="1/2/2007",nrows=2880)
        setnames(housepwrDT,getHeaderList())
        housepwrDT <- transformDateTime(housepwrDT)
        housepwrDT
}

getHeaderList <- function() {
        firstRowDt <- read.table(dataFile,sep = ";",nrows = 1,header = TRUE)
        names(firstRowDt)
}

transformDateTime <- function(housepwrDT) {
        dataSet <- 
                mutate(housepwrDT,
                       datetime = as.POSIXct(paste(Date,Time),tz = "", format = dateTimeFormat)) %>%
                select(datetime,Global_active_power:Sub_metering_3)
        
        dataSet
}
