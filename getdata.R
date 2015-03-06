# Exploratory Data Analysis
# Course Project 1
# Getting and cleaning data for the project

setwd("C:/CRS/data_science/ExData_Plotting1");

# Downloading file to working directory
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
fname <- "data_full.zip";
download.file(url, fname);


# Reading file to data frame
# unz() unzips the file on the fly without writing it to the disk
# specifying two first columns as character and the rest as numeric
# changing '?' to NA

df <-  read.table(unz("data_full.zip","household_power_consumption.txt"), 
                  header=T, sep = ";", 
                  stringsAsFactors = F,
                  colClasses=c(rep("character",2), rep("numeric", 7)),
                  na.strings = '?'
                  );
head(df);


# Using dplyr package to select relevant data
# http://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html
library(dplyr);
epc <- tbl_df(df);

epc;

# chaining dplyr commands in order to obtain final tidy data set
epc.tidy <- epc %>%
  mutate(dtm = paste(Date, Time), dtm.proper = as.POSIXct(strptime(dtm, format="%d/%m/%Y %H:%M:%S"))) %>%
  select(dtm.proper, Global_active_power, Global_reactive_power, Voltage, Sub_metering_1:Sub_metering_3);


# helper function to convert string to date-time variable
to.date <- function(data.string) {
  
  return (as.POSIXct(strptime(data.string, "%Y-%m-%d")));
  
}

# time range of the analysis
start.date <- to.date("2007-02-01");
end.date <- to.date("2007-02-03");

# filtering relevant dates only (note: end.date = 2007-02-03, because the time is 00:00:00, 
# if end.date was set to 2007-02-02, only previous day would be included

epc.filter <- epc.tidy %>%
  filter(dtm.proper >= start.date, dtm.proper < end.date) %>%
  arrange(dtm.proper)


# dumping the file as text for future re-use
dump(list="epc.filter", file = "dump_epc_filter.R")

# deleting the unnesesary data sets
rm(list=c("df", "epc.tidy", "epc"))

