#Plot 5:How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motor <- NEI %>%
  filter(type=="ON-ROAD" & fips == "24510") %>%
  group_by(year) %>%
  summarise(`Total Emissions` = sum(Emissions))

q5 <- motor %>%
  ggplot(aes(x=year, y=`Total Emissions`)) + geom_line() + ggtitle("Baltimore City's Tons of On-Road Emissions by Year")
