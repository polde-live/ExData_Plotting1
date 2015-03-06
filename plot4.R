# Exploratory Data Analysis
# Course Project 1
# Plot 4

# Get the filtered data
if (!exists("epc.filter")) {
  
  print("Loading epc.filter dataset.");
  source("dump_epc_filter.R");
  
}

# datetime vs Voltage
plot4.1 <- function() {
  
  Voltage <- epc.filter$Voltage;
  datetime <- epc.filter$dtm.proper
  plot(x = datetime, y=Voltage, type = "l");
  
}


# datetime vs. Global Reactive Power
plot4.2 <- function() {
  datetime <- epc.filter$dtm.proper;
  Global_reactive_power <- epc.filter$Global_reactive_power;
  plot(x = datetime, y=Global_reactive_power, type = "l");
  
}

plot4 <- function() {
  par(mfrow=c(2,2));
  
  source("plot2.R");
  plot4.1();
  source("plot3.R");
  plot4.2();
  
  par(mfrow=c(1,1));

}


png("figure/plot4.png");
plot4();
dev.off()
