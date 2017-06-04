#load common functions
source("common_functions.R")




# load the dataset
if (!exists("hpc")) {
    hpc <- read_data() 
}

#construct the plot1.png plot
# this is an histogram of frequency of Global Active Power 

do_plot(hpc, "Plot1.png", 
        function(hpc) {
            hist(hpc$Global_active_power, col="red", 
                 xlab = "Global Active Power (kilowatts)", 
                 main = "Global Active Power")
        }
)


