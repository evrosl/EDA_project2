# get emmission data from "summarySCC_PM25.rds" file
em <- readRDS("summarySCC_PM25.rds")
# get data just for Baltimore
balt<- subset(em, fips == "24510")
# sum emissions by year
yem <- aggregate(cbind(Emissions) ~year, data=balt, sum)
# create png
png(file="plot2.png",width=480,height=480)
# plot data points
par(mfrow=c(1,1))
plot(yem$year,yem$Emissions, ylab='Baltimore Emmisions (tons)',  xlab='Year')
# close graphics device
dev.off() 
