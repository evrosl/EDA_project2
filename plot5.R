library(ggplot2)
# get emmission data from "summarySCC_PM25.rds" file
NEI <- readRDS("summarySCC_PM25.rds")
# get data for Motor Vehicles in Baltimore
mv<-subset(NEI, type=="ON-ROAD" & fips == "24510")
# # sum emissions by year
mvy <- aggregate(cbind(Emissions) ~year, data=mv, sum)
# create png
png(file="plot5.png",width=480,height=480)
# plot data points
par(mfrow=c(1,1))
plot(mvy$year,mvy$Emissions, ylab='Emmisions from Motor Vehicles (tons)',
     xlab='Year', main='Emissions from Motor Vehicles for Baltimore')
# close graphics device
dev.off() 
