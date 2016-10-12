# Exploratory Data Analysis
# Course Project 1
# Pawel Daniluk, 2016-10-17
# Plot 4

# Get the filtered data
if (!exists("epc.filter")) {
  
  print("Loading epc.filter dataset.");
  source("dump_epc_filter.R");
  
}


# Function for creating partial plot: datetime vs Voltage
plot4.1 <- function() {
  
  Voltage <- epc.filter$Voltage;
  datetime <- epc.filter$dtm.proper
  plot(x = datetime, y=Voltage, type = "l");
  
}


# Function for creating partial plot: datetime vs. Global Reactive Power
plot4.2 <- function() {
  datetime <- epc.filter$dtm.proper;
  Global_reactive_power <- epc.filter$Global_reactive_power;
  plot(x = datetime, y=Global_reactive_power, type = "l");

}

# If plotting functions not defined, source them.
if (!exists("plot2")) {source("plot2.R");}
if (!exists("plot3")) {source("plot3.R");}

# Create plot 4 as 2X2 matrix of plots 2, 3, 4.1, 4.2
plot4 <- function() {
  par(mfrow=c(2,2));
  
  plot2();
  plot4.1();
  plot3();
  plot4.2();
  
  par(mfrow=c(1,1));

}
  
# Create plot 1 and write to file with png device
png("figure/plot4.png");
plot4();
dev.off()
