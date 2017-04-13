## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset for coal
SCC.coal = SCC[grepl("coal", SCC$EI.Sector, ignore.case=TRUE),]
NEI.coal <- merge(NEI, SCC.coal, by = "SCC")

#make sum of emissions
total.emissions <- tapply(NEI.coal$Emissions, NEI.coal$year, sum)

#open PNG device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#plot the data
plot(rownames(total.emissions), total.emissions/1000, 
     type = "b", pch = 18, col = "red", 
     ylab = "Total PM2.5 Emissions(in kilo tons)", 
     xlab = "Year", main = "Annual Emissions due to Coal",
     ylim = c(0,600))
# Close the PNG device
dev.off()