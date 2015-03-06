# Exploratory Data Analysis
# Course Project 1
# Plot 2

# Get the filtered data
if (!exists("epc.filter")) {
  
  print("Loading epc.filter dataset.");
  source("dump_epc_filter.R");
  
}



plot2 <- function() {

  gap <- epc.filter$Global_active_power;
  tm <-  epc.filter$dtm.proper;
  ylbl <- "Global Active Power (kilowatts)";
  
  # Changing locale in order to get english weekday names (Windows)
  Sys.setlocale("LC_TIME", "English")
  plot(tm, gap, ylab = ylbl, xlab="", type="l");


}

png("figure/plot2.png");
plot2();
dev.off()