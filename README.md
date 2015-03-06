# Exploratory Data Analysis: Course Project 1

Below please find description of the programs for the Course Project 1.

## getdata.R

Downloads the file from the internet and reads the compressed data into data frame "df".  The "Date" and "Time" variables were read as character, while the rest was read as numeric. The '?' character was replaced to NA.

Then, dplyr package is used to process and filter the relevant data. [More information on dplyr](http://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html).

Datetime variable "dtm.proper" was created from character variables "Date" and "Time", and stored in POSIXct format.

The final data set for the analysis is "epc.filter", dumped to the file "dump_epc_filter.R". The file contains 2880 observations and can be recreated by running the file.

## dump_epc_filter.R

Text file, representing the filtered and cleaned data set for further use. It can be loaded into memory by opening the file running the code or with the "source" command. 

## plot1.R

Function creating plot1 and saving it in png format.

## plot2.R

Function creating plot2 and saving it in png format

## plot3.R

Function creating plot3 and saving it in png format

## plot4.R

Set of functions for creating 2x2 plot matrix. The plot2 and plot3 functions are reused. The plot4.1 and plot4.2 are helper functions for creating other required plots. Finally plot4 function sets the mfrow parameter and calls each plotting function in sequence, to create final output and save it in png format. 