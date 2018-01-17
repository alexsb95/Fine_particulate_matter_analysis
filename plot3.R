## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

plot3 <- function(){
  require(ggplot2)
  
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("summarySCC_PM25.rds")
  
  ## Extract the baltimore data only
  Baltimore_Data <- subset(NEI, NEI$fips == "24510")
  
  ## Get the total emissions per year
  Balt_Emmission <- aggregate(Emissions ~ year + type ,Baltimore_Data, FUN = sum)
  
  png(file = "plot3.png")

  
  qplot(year, Emissions, data = Balt_Emmission , color = type, geom = c("point","smooth"), method = "lm",
         xlab = "Year", ylab = "Total emissions", main = "Total emissions based on the source type in the Baltimore City")

  dev.off()

}