library(ggplot2)
# get emmission data from "summarySCC_PM25.rds" file
NEI <- readRDS("summarySCC_PM25.rds")
# get source classification
SCC <- readRDS("Source_Classification_Code.rds")
# find all the sources that contain word coal in name
ci<-subset(SCC, grepl("coal",as.character(Short.Name),ignore.case = TRUE))
# get the corresponding codes
ciSCC <- ci$SCC
# get emission data just for coal sources
coalSources<- subset(NEI, SCC %in% ciSCC)
# sum emissions by year
yc <- aggregate(cbind(Emissions) ~year, data=coalSources, sum)
# create png
png(file="plot4.png",width=480,height=480)
# plot data points
par(mfrow=c(1,1))
plot(yc$year,yc$Emissions, ylab='Coal Sources Emmisions (tons)',  xlab='Year')
# close graphics device
dev.off() 
