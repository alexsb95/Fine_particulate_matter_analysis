
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.


plot1 <- function(){
  ## Read data
  NEI <- readRDS("summarySCC_PM25.rds")
  
  ## Get the total emissions per year
  Emissions_Data <- aggregate(Emissions ~ year , data = NEI, FUN = sum)
  
  png(file = "plot1.png")
  
  plot(Emissions_Data$year, Emissions_Data$Emissions, , type = "l", xlab = "Year", ylab = "Total emissions", 
       main = expression("Total emissions from PM" [2.5]* " in the United States"))

  dev.off()
  
}