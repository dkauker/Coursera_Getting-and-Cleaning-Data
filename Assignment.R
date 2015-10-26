#   Assume the zip file is in the working directory
unzip ("exdata_data_NEI_data.zip")

SCC<- readRDS ("Source_Classification_Code.rds")
NEI<- readRDS ("summarySCC_PM25.rds")

Emissions<- NEI$Emissions
year<- NEI$year

png(filename = "plot_1.png", width = 500, height = 500, units = "px")
plot (year, Emissions, pch = 20)
model<- lm (year ~ Emissions)
abline (model, lwd = 2)
dev.off()
###########


Baltimore<- SCC[SCC$fips == "24510",]