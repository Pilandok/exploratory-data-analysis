## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset for Maryland vehicles
Baltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")


#make sum of emissions
total.emissions <- tapply(Baltimore$Emissions, Baltimore$year, sum)

#open PNG device
png(filename = "plot5.png", width = 480, height = 480, units = "px")

#plot the data
plot(rownames(total.emissions), total.emissions, 
     type = "b", pch = 18, col = "red", 
     ylab = "Total PM2.5 Emissions", 
     xlab = "Year", main = "Annual Motor Emissions for Maryland", ylim = c(0, 400))
# Close the PNG device
dev.off()