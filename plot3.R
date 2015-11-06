# Script to generate plot #3
#
# To run
# > df <- read_data()
# > plot_3(df)

# include script that implements 'read_data' to load project data
source("read_data.R")

plot_3 <- function(df) {
  # Submeters 1,2,3 vs time
  plot.new()
  
  # reset the margins
  set_default_graphical_parameters()
  
  # make plot
  with(df, plot(datetime, Sub_metering_1, type="l", ylab = "Energy Sub Metering"))
  with(df, points(datetime, Sub_metering_2, type="l", col="red"))
  with(df, points(datetime, Sub_metering_3, type="l", col="blue"))
  legend("topright", lty=c(1,1,1), col = c("black", "blue", "red"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         text.width = strwidth("Sub_metering_2")*1.5)
  dev.copy(png, width = 480, height = 480, units = "px", "plot3.png")
  dev.off()
  print("Generated plot3.png")
}
