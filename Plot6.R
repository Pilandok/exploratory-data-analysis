## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset for Maryland vehicles
#subset for Maryland vehicles
Baltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")
LA <- subset(NEI, fips == "06037" & type == "ON-ROAD")


#make sum of emissions
total.emissions1 <- tapply(Baltimore$Emissions, Baltimore$year, sum)
total.emissions2 <- tapply(LA$Emissions, LA$year, sum)

#open PNG device
png(filename = "plot6.png", width = 480, height = 480, units = "px")

#plot the data
par(mfrow=c(1,2))
plot(rownames(total.emissions1), total.emissions1, 
     type = "b", pch = 18, col = "red", 
     ylab = "Total PM2.5 Emissions", 
     xlab = "Year", main = "Maryland Motor Emissions")
plot(rownames(total.emissions2), total.emissions2, 
     type = "b", pch = 18, col = "blue", 
     ylab = "Total PM2.5 Emissions", 
     xlab = "Year", main = "LA Motor Emissions")

# Close the PNG device
dev.off()
