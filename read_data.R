# script to read and filter the project data. This script is 'sourced' by the other plot scripts.

read_data <- function() {
  
  # read a small sample to get the column classes
  df <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", nrows = 100, stringsAsFactors = FALSE)
  classes <- sapply(df, class)
  
  # read entire dataset
  # I estimate the entire dataset is 1.1G.
  df <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", colClasses = classes, stringsAsFactors = FALSE, na.strings = "?")
  
  # create a datetime string from the Date and Time cols
  df <- transform(df, datetime=paste(Date, Time)) 
  
  # convert the date character string into a Date()
  df <- transform(df, Date = strptime(Date, "%d/%m/%Y") )
  
  # convert Date/Time to datetime 
  df <- transform(df, datetime = strptime(datetime, "%d/%m/%Y %H:%M:%S") )
  
  # we only need data for '2007-02-01' and '2007-02-02'
  rows_for_dates <- df$Date %in% c('2007-02-01', '2007-02-02')
  df <- df[rows_for_dates,]
  df
}

set_default_graphical_parameters <- function() {
  # Set default device parameters
  
  # mfrow
  # A vector of the form c(nr, nc). Subsequent figures will be drawn in an nr-by-nc 
  # array on the device by columns (mfcol), or rows (mfrow), respectively.
  
  # mar
  # A numerical vector of the form c(bottom, left, top, right) which gives the 
  # number of lines of margin to be specified on the four sides of the plot. 
  # The default is c(5, 4, 4, 2) + 0.1.
  
  # oma
  # A vector of the form c(bottom, left, top, right) giving the size of the 
  # outer margins in lines of text.
  
  # cex
  # A numerical value giving the amount by which plotting text and symbols should 
  # be magnified relative to the default. This starts as 1 when a device is opened,
  # and is reset when the layout is changed, e.g. by setting mfrow.
  par(mfrow = c(1, 1), mar = c(5.1, 4.1, 4.1, 2.1), oma = c(0, 0, 0, 0), cex=1.0)
}