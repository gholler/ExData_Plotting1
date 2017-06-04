#load common functions
source("common_functions.R")



# load the dataset
if (!exists("hpc")) {
    hpc <- read_data() 
}
    
#construct the plot2.png plot
# this is a line plot that shows 
# evolution of Global Active Power with time 

do_plot(hpc, "Plot2.png", 
    function(hpc) {
        with(
            hpc, 
            plot(Time, Global_active_power, type="l", 
                 ylab = "Global Active Power (kilowatts)", xlab = NA)
        )
    }
)
