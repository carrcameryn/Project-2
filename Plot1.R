##Load in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Plot 1 :Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

e_total <- NEI %>%
  group_by(year) %>%
  summarise(`Total Emissions` = sum(Emissions))
e_total$kilotons  <- e_total$`Total Emissions`/1000

q1 <- barplot(height = e_total$kilotons, names.arg = e_total$year, xlab = "Years", ylab = "Total Emissions in Kilotons",
              main = "Total Emission in Kilotons by Year")