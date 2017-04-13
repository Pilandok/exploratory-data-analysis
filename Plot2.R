## This first line will likely take a few seconds. Be patient!
#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

#subset maryland
MD <- subset(NEI, fips=='24510')

#make sum of emissions
total.emissions <- tapply(MD$Emissions, MD$year, sum)

#open PNG device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

#plot the data
plot(rownames(total.emissions), total.emissions/1000, 
     type = "b", pch = 18, col = "red", 
     ylab = "Total PM2.5 Emissions(in kilotons)", 
     xlab = "Year", main = "Annual Emissions for Baltimore City, MD")

# Close the PNG device
dev.off()