#Plot 4: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC$coal <- ifelse(grepl("Fuel Comb.*Coal", SCC$EI.Sector),1,0)
coal <- subset(SCC, coal==1)
coal_source <- subset(NEI,NEI$SCC %in% coal$SCC)
coal_source <- coal_source %>%
  group_by(year) %>%
  summarise(`Total Emissions` = sum(Emissions))
q4 <- coal_source %>%
  ggplot(aes(x=year, y=`Total Emissions`)) + geom_line() + ggtitle("USA's Tons of Coal Combustion Emissions by Year")
