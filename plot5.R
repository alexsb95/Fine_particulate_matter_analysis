## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

plot5 <- function(){
  require(ggplot2)
  
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("summarySCC_PM25.rds")
  
  ## Extract the baltimore data and the motor vehicle sources
  Baltimore_Data <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
  
  ## Get the total emissions per year
  Balt_Emmission <- aggregate(Emissions ~ year ,Baltimore_Data, FUN = sum)
  
  png(file = "plot5.png")
  
  
  qplot(year, Emissions, data = Balt_Emmission, geom = c("point","smooth"), method = "lm",
        xlab = "Year", ylab = "Total emissions", main = "Emissions from motor vehicle sources in the Baltimore City")
  
  dev.off()
  
}