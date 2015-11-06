# Script to generate plot #2
#
# To run
# > df <- read_data()
# > plot_2(df)

# include script that implements 'read_data' to load project data
source("read_data.R")

plot_2 <- function(df) {
  # Global Active power vs time
  # Histogram of 'Global Active Power'
  plot.new()
  
  # reset the margins
  set_default_graphical_parameters()
  
  # make plot
  with(df, plot(datetime, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)"))
  dev.copy(png, width = 480, height = 480, units = "px", "plot2.png")
  dev.off()
  print("Generated plot2.png")
}