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