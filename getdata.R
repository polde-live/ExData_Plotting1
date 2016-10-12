# Exploratory Data Analysis
# Course Project 1
# Pawel Daniluk, 2016-10-17
# Getting and cleaning data for the project

# Downloading file to working directory
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fname <- "data_full.zip"
download.file(url, fname)
print('data file downloaded')

# Reading zip file to r data frame
# unz() function unzips the file on the fly without writing it to the disk
# colClass parameter sets two first columns as character and the next seven 
# as numeric
# na.string replaces '?' with NA values 

df <-  read.table(unz(description = "data_full.zip", filename="household_power_consumption.txt"), 
                  header=T, sep = ";",
                  stringsAsFactors = F,
                  colClasses=c(rep("character",2), rep("numeric", 7)),
                  na.strings = '?'
                  )
print('text data read into data frame')
# using dplyr package to select relevant data
# more information:
# http://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html

library(dplyr)
epc <- tbl_df(df)

# chaining dplyr commands with %>% operator, in order to obtain tidy data set
# Date and Time variables are combined in order to create datetime variable
# finally, only the variables that are relevant to the project are selected
epc.tidy <- epc %>%
  mutate(dtm = paste(Date, Time), dtm.proper = as.POSIXct(strptime(dtm, format="%d/%m/%Y %H:%M:%S"))) %>%
  select(dtm.proper, Global_active_power, Global_reactive_power, Voltage, Sub_metering_1:Sub_metering_3)
print('tidy data set created')

# helper function to convert string to date-time variable
to.date <- function(data.string) {
  
  return (as.POSIXct(strptime(data.string, "%Y-%m-%d")))
  
}

# time range of the analysis
start.date <- to.date("2007-02-01")
end.date <- to.date("2007-02-03")

# filtering relevant dates only (note: end.date = 2007-02-03, because the time is 00:00:00, 
# if end.date was set to 2007-02-02, only previous day would be included
epc.filter <- epc.tidy %>%
  filter(dtm.proper >= start.date, dtm.proper < end.date) %>%
  arrange(dtm.proper)
print('data filtered and arranged')

# dumping the tidy data set as text file for future re-use
# in this way, plots can be created without downloading the original file
dump(list="epc.filter", file = "dump_epc_filter.R")
print('data dumped')

# removing the unnecessary data sets from the memory
rm(list=c("df", "epc.tidy", "epc"))
print('memory clear')
