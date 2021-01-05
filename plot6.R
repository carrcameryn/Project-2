#Plot 6: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

compare <- NEI  %>%
  filter(fips==c("24510","06037") & type =="ON-ROAD") %>%
  group_by(fips,year) %>%
  summarise(`Total Emissions` = sum(Emissions))
q6 <- compare %>%
  ggplot(aes(x=year, y=`Total Emissions`, group=fips,color=fips)) + geom_line() + ggtitle("Baltimore City vs. LA Tons of On-Road Emissions by Year")

