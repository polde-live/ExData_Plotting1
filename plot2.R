# Exploratory Data Analysis
# Course Project 1
# Pawel Daniluk, 2016-10-17
# Plot 2

# Get the filtered data
if (!exists("epc.filter")) {
  
  print("Loading epc.filter dataset.");
  source("dump_epc_filter.R");
  
}

# Function for creating plot 2 of the project
plot2 <- function() {

  gap <- epc.filter$Global_active_power;
  tm <-  epc.filter$dtm.proper;
  ylbl <- "Global Active Power (kilowatts)";
  
  # Changing locale in order to get english weekday names (Windows)
  Sys.setlocale("LC_TIME", "English")
  plot(tm, gap, ylab = ylbl, xlab="", type="l");


}

# Create plot 2 and write to file with png device
png("figure/plot2.png");
plot2();
dev.off()
