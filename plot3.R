#Plot 3: Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?
#Use the ggplot2 plotting system to make a plot answer this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

types <- NEI %>%
  filter(fips=="24510") %>%
  group_by(type,year) %>%
  summarise(`Total Emissions` = sum(Emissions))
types$kilotons <- types$`Total Emissions`/1000

q3 <- types %>%
  ggplot(aes(x=year, y=`Total Emissions`, group=type,color=type)) + geom_line() + ggtitle("Baltimore City's Tons of Emissions by Type & Year")
