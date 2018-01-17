## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

plot3 <- function(){
  require(ggplot2)
  
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  ## Get the coal combustion-related sources data
  coal_sources <- SCC[grep("Coal",SCC$Short.Name),1]
  coal_data <- subset(NEI, NEI$SCC %in% coal_sources)
  
  ## Get the total emissions per year
  Coal_Emmission <- aggregate(Emissions ~ year ,coal_data, FUN = sum)
  
  Coal_Emmission$SCC <- as.factor(Coal_Emmission$SCC)
  
  png(file = "plot4.png")
  
  plot(Coal_Emmission$year, Coal_Emmission$Emissions, type = "l", xlab = "Year", ylab = "Total emissions", 
       main = "Emissions from coal in the United States ")
  
  #qplot(year, Emissions, data = Coal_Emmission, geom = c("point","smooth"), method = "lm")
  
  dev.off()
  
}