# Exploratory Data Analysis
# Course Project 1
# Plot 1

# Get the filtered data
if (!exists("epc.filter")) {
  
  print("Loading epc.filter dataset.");
  source("dump_epc_filter.R");
  
}

plot1 <- function() {
  
  gap <- epc.filter$Global_active_power;
  xlbl = "Global Active Power (kilowatts)";
  hist(gap, xlab = xlbl, col="red", main="Global Active Power");

}

png("figure/plot1.png");
plot1();
dev.off();
