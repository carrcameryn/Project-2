#Plot 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") 
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.
 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

maryland <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(`Total Emissions` = sum(Emissions))
maryland$kilotons <- maryland$`Total Emissions`/1000
q2 <- barplot(height = maryland$kilotons, names.arg = maryland$year, xlab = "Years", ylab = "Total Emissions in Kilotons",
              main = "Baltimore  City's Total Emissions in Kilotons by Year")
