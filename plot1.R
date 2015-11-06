# Script to generate plot #1
#
# To run
# > df <- read_data()
# > plot_1(df)

# include script that implements 'read_data' to load project data
source("read_data.R")

plot_1 <- function(df) {
  # Histogram of 'Global Active Power'
  plot.new()
  
  # reset the margins
  set_default_graphical_parameters()
  
  # make plot
  hist(df$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
  dev.copy(png, width = 480, height = 480, units = "px", "plot1.png")
  dev.off()
  print("Generated plot1.png")
}