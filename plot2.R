
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.

plot2 <- function(){
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("summarySCC_PM25.rds")
  
  ## Extract the baltimore data only
  Baltimore_Data <- subset(NEI, NEI$fips == "24510")
  
  ## Get the total emissions per year
  Emissions_Data <- aggregate(Emissions ~ year ,Baltimore_Data, FUN = sum)
  
  png(file = "plot2.png")
  
  plot(Emissions_Data$year, Emissions_Data$Emissions, , type = "l", xlab = "Year", ylab = "Total emissions", main = "Total emissions from PM2.5 in the Baltimore City, Maryland")
  
  dev.off()
  
}