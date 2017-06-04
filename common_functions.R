library(dplyr)
library(data.table)

clear_all <- function() {
    rm(list=ls())
}


#read the dataset
# this function loads and unzip the csv file if needed
# and then construct a dataframe that 
# only contains data from 2007-02-01 to 2007-02-02
# Date and Time character columns from original file are replaced
# with date and time
read_data <- function () {
    filename <- "household_power_consumption.txt"
    zip_filename <- paste(filename, ".zip")
    if (!file.exists(filename)) {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, zip_filename, method = "curl")
    }
    
    hpc <- read.table(filename, header = TRUE, sep=";", 
                           colClasses = c( NA, NA, NA, "numeric", "numeric", "numeric",
                                                "numeric", "numeric", "numeric" ),
                           na.strings = "?")
    
    hpc <- transform(hpc, Time=strptime(paste(Date, " ", Time), "%d/%m/%Y %H:%M:%S"), 
                        Date = strptime(Date, "%d/%m/%Y"))
    minDate <- strptime("01/02/2007", "%d/%m/%Y")
    maxDate <- strptime("02/02/2007", "%d/%m/%Y")
    hpc <-  subset(hpc, !is.na(Date) & Date >= minDate & Date <= maxDate)
    hpc
    
}

## this generic function will produce some plotting on a dataframe and outputs
# the result to a png file, hiding the scarry details
# hpc the houseold power consumption dataframe
# png_file path to png file
# plotting_function the function that will actually plots. This function must accept
#                   the hpc dataframe as a single parameter and should not care
#                   on graphic device manipulation
do_plot <- function (hpc, png_file, plotting_function) {

    #make sure Locale is En_US
    loc = Sys.getlocale("LC_TIME")
    Sys.setlocale(category = "LC_TIME",locale = "En_US.UTF-8")
    
    #open the png device and switch to it
    png(png_file)
    
    plotting_function(hpc)
    
    
    #close the png device
    dev.off()
    
    #reset the locale to saved value
    Sys.setlocale(category = "LC_TIME", locale = loc)
    
}