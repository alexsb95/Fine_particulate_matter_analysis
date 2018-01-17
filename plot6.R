## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
## in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

plot5 <- function(){
  require(ggplot2)
  
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("summarySCC_PM25.rds")
  
  ## Extract the baltimore data and the motor vehicle sources
  Cities_Data <- subset(NEI, (NEI$fips == "24510" |  NEI$fips == "06037") & NEI$type == "ON-ROAD")
  
  Cities_Data$fips <- as.factor(Cities_Data$fips)
  
  ## Get the total emissions per year
  Cities_Emmission <- aggregate(Emissions ~ year + fips ,Cities_Data, FUN = sum)
  
  png(file = "plot6.png")
  
  
  qplot(year, Emissions, data = Cities_Emmission, color = fips, geom = c("point","smooth"), method = "lm",
        xlab = "Year", ylab = "Total emissions", main = "Emissions from motor vehicle sources in the Baltimore City")
  
  dev.off()
  
}