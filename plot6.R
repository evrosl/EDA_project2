library(ggplot2)
# get emmission data from "summarySCC_PM25.rds" file
NEI <- readRDS("summarySCC_PM25.rds")
# get data for Motor Vehicles in Baltimore
mvBalt <-subset(NEI, type=="ON-ROAD" & fips == "24510")
# get data for Motor Vehicles in Baltimore
mvLA <-subset(NEI, type=="ON-ROAD" & fips == "06037")
# # sum emissions by year
mvBalt <- aggregate(cbind(Emissions) ~year, data=mvBalt, sum)
mvLA <- aggregate(cbind(Emissions) ~year, data=mvLA, sum)
# create png
png(file="plot6.png",width=480,height=480)
# plot data points
par(mfrow=c(1,2))
plot(mvBalt$year,mvBalt$Emissions, ylab='Emmisions from Motor Vehicles, Balt., MA (tons)',
     xlab='Year')
plot(mvLA$year,mvLA$Emissions, ylab='Emmisions from Motor Vehicles, L.A. county, CA (tons)',
     xlab='Year')

# close graphics device
dev.off() 
