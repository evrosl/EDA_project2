library(ggplot2)
# get emmission data from "summarySCC_PM25.rds" file
em <- readRDS("summarySCC_PM25.rds")
# get data just for Baltimore
balt<- subset(em, fips == "24510")
# sum emissions by year and type
ytem <- aggregate(cbind(Emissions) ~year+type, data=balt, sum)
# create png
png(file="plot3.png",width=480,height=480)
g<- ggplot(ytem, aes(year,Emissions, color=type))+geom_point()+geom_line()
print(g)
dev.off() 
