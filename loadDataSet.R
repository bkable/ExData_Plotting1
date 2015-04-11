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
        
        print("Loading Dataset")
        
        housepwrDT <- NULL
        
        # If a unix platform, do system level grep filter for Jan/Feb 2007 data
        # for more efficient memory usage
        
        if(isUnixPlatform()) {
                print("Unix environment detected, Subsetting data through system grep for Jan, Feb 2007")
                subsetFile()
                print("Loading Data Table")
                housepwrDT <- read.table(subsetDataFile,sep = ";")
                names(housepwrDT) <- getHeaderList()
        # If Windows default to full data set load and subset after
        } else {
                print("Loading Data Table")
                housepwrDT <- read.table(dataFile,sep = ";")
                names(housepwrDT) <- getHeaderList()
                housepwrDT <- subset(housepwrDT, housepwrDT$Date == "1/2/2007" | housepwrDT$Date == "2/2/2007")
        }
        
        housepwrDT
}

subsetFile <- function() {
        system2("grep",c("^[1,2]/2/2007",dataFile,">",subsetDataFile))
}

getHeaderList <- function() {
        firstRowDt <- read.table(dataFile,sep = ";",nrows = 1,header = TRUE)
        names(firstRowDt)
}

isUnixPlatform <- function() {
        if(.Platform$OS.type == "unix") TRUE
        else FALSE
}