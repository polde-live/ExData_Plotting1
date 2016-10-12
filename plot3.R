# Exploratory Data Analysis
# Course Project 1
# Pawel Daniluk, 2016-10-17
# Plot 3

# Get the filtered data
if (!exists("epc.filter")) {
  
  print("Loading epc.filter dataset.");
  source("dump_epc_filter.R");
  
}

# Function for creating plot 3 of the project
plot3 <- function() {

  # Changing locale in order to get english weekday names (Windows)
  Sys.setlocale("LC_TIME", "English");
  
  tm <-  epc.filter$dtm.proper;
  esm1 = epc.filter$Sub_metering_1;
  esm2 = epc.filter$Sub_metering_2;
  esm3 = epc.filter$Sub_metering_3;
  
  ylbl <- "Energy sub metering";
  
  plot(x=tm, y=esm1, type = "n", ylab = ylbl, xlab = "");
  points(x = tm, y = esm1, col = "black", type = "l");
  points(x = tm, y = esm2, col = "red", type = "l");
  points(x = tm, y = esm3, col = "blue", type = "l");
  legend("topright", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col = c("black", "red", "blue"),
         lty=1,
         lwd=1
         );

}

# Create plot 3 and write to file with png device
png("figure/plot3.png");
plot3();
dev.off()
