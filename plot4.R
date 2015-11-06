# Script to generate plot #4
#
# To run
# > df <- read_data()
# > plot_4(df)

# include script that implements 'read_data' to load project data
source("read_data.R")

plot_4 <- function(df) {
  # lotta plotz. not quite sure how to make 4 annotated plots fit into 480 x 480 PNG. :-/
  plot.new()
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0), cex=0.70)
  with(df, {
    plot(datetime, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)")
    plot(datetime, Voltage, type="l", ylab = "Voltage")
    plot(datetime, Sub_metering_1, type="l", ylab = "Energy Sub Metering")
    points(datetime, Sub_metering_2, type="l", col="red")
    points(datetime, Sub_metering_3, type="l", col="blue")
    legend("topright", lty=c(1,1,1), col = c("black", "blue", "red"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           text.width = strwidth("Sub_metering_2")*1.5)
    plot(datetime, Global_reactive_power, type="l", ylab = "Global Reactive Power (kilowatts)")
    dev.copy(png, width = 480, height = 480, units = "px", "plot4.png")
    dev.off()
    print("Generated plot4.png")
  })

  # reset the margins
  par(mfrow = c(1, 1), mar = c(5.1, 4.1, 4.1, 2.1), oma = c(0, 0, 0, 0), cex = 1.0)
}
