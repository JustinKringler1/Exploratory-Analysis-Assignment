#Library
library(dplyr)
library("ggplot2")

# Download files from:
# "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
# and put in your working directory

# Reading in datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

############################ Question 6 ########################################
# Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California 
# (fips == "06037"). Which city has seen greater changes over
# time in motor vehicle emissions?
################################################################################

# Filtering for baltimore
Maryland_NEI <- NEI %>%
  filter(fips=="24510")

# Filtering for baltimore on road
Motor_M_NEI <- Maryland_NEI %>%
  filter(type=="ON-ROAD")

# filtering for california on road
California_M_NEI <- NEI %>%
  filter(fips=="06037") %>%
  filter(type=="ON-ROAD")

#aggregating to get by year and calculate sum
m1 <- aggregate(Emissions ~ year, Motor_M_NEI, sum)
m2 <- aggregate(Emissions ~ year,California_M_NEI, sum)

# Creating Plot 6:
png(file="C:/Users/cc13m/OneDrive/Desktop/Data Science Resources/Exploratory_Data_Analysis/Assignment2/plot6.png",
    width=480, height=480)

#Plotting the data
ggplot() + 
  geom_point(data=m1, aes(x=year, y=Emissions), color='blue') + 
  geom_point(data=m2, aes(x=year, y=Emissions), color='red') +
  geom_line(data=m1, aes(x=year, y=Emissions), color='blue') + 
  geom_line(data=m2, aes(x=year, y=Emissions), color='red') +
  ggtitle("Baltimore and Los Angeles Motor Vehicle Emissions by Year
          ( red = Los Angeles blue = Baltimore )") +
  xlab("Year") +
  ylab("Emissions") 

dev.off()

# ANSWER: Los Angeles has the greatest increase over time as we can see 
# by the graph.
