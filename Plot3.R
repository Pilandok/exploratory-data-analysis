## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset
Baltimore <- subset(NEI, fips == "24510")

#sum by year and type
emission_by_type <- ddply(Baltimore, .(year, type),  summarize, Emissions = sum(Emissions))
colnames(emission_by_type)[3] <- "Emissions"

#open PNG
png(filename = "plot3.png", width = 480, height = 480, units = "px")

#plot
qplot(year, Emissions, data = emission_by_type,  geom = "line", color = type, main = "Baltimore City Emissions by Type and Year") 

# Close the PNG device
dev.off()