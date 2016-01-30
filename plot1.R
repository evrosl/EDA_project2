# get emmission data from "summarySCC_PM25.rds" file
em <- readRDS("summarySCC_PM25.rds")
# sum emissions by year
yem <- aggregate(cbind(Emissions) ~year, data=em, sum)
# create png
png(file="plot1.png",width=480,height=480)
# plot data points
par(mfrow=c(1,1))
plot(yem$year,yem$Emissions, ylab='Emmisions (tons)',  xlab='Year')
# close graphics device
dev.off() 
