#Library
library(dplyr)
library("ggplot2")

# Download files from:
# "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
# and put in your working directory


# Reading in datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

############################ Question 3 ########################################
# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of these four sources have
# seen decreases in emissions from 1999-2008 for Baltimore City?
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
################################################################################

# Filtering data for baltimore
Maryland_NEI <- NEI %>%
  filter(fips=="24510")

# Aggregating the data to fit what were looking for (should have done this for
# the last problem)
data <- aggregate(Emissions ~ year + type, Maryland_NEI, sum)

# Creating Plot 3:
png(file="C:/Users/cc13m/OneDrive/Desktop/Data Science Resources/Exploratory_Data_Analysis/Assignment2/plot3.png",
    width=480, height=480)

# plotting the data
ggplot(data,aes(x = year,y = Emissions, col = type))+
  geom_point()+
  geom_line()+
  ggtitle("Total Baltimore Emissions by Type and Year") 

dev.off()

# ANSWER: All of the types decreased but type "point" had a huge increase in 
# 2005 and by 2008 it was still just above where it started.