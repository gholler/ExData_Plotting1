#load common functions
source("common_functions.R")



# load the dataset
if (!exists("hpc")) {
    hpc <- read_data() 
}
    
#construct the plot2.png plot
# this is a line plot that shows 
# evolution of Global Active Power with time 

do_plot(hpc, "Plot3.png", 
    function(hpc) {
        with(
                 hpc, 
                 c(plot(Time, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = NA),
                 lines(Time, Sub_metering_1, type = "l"),
                 lines(Time, Sub_metering_2, type = "l",col = "red"),
                 lines(Time, Sub_metering_3, type="l", col = "blue")
                 )
        )
        
        legend("topright", 
               legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
               col =c("black", "red", "blue"), lty=1, lwd=1)
        
    }
)
