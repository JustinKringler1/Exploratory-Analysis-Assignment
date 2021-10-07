#Library
library(dplyr)
library("ggplot2")

# Download files from:
# "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
# and put in your working directory

# Reading in datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

############################ Question 5 ########################################
# How have emissions from motor vehicle sources changed from
# 1999-2008 in Baltimore City?
################################################################################

# Filtering for baltimore (could combine this and the next step)
Maryland_NEI <- NEI %>%
  filter(fips=="24510")

#filtering for just motor vehicles in baltimore
Motor_M_NEI <- Maryland_NEI %>%
  filter(type=="ON-ROAD")

#aggregating to get by year and calculate sum
m1 <- aggregate(Emissions ~ year, Motor_M_NEI, sum)

# Creating Plot 5:
png(file="C:/Users/cc13m/OneDrive/Desktop/Data Science Resources/Exploratory_Data_Analysis/Assignment2/plot5.png",
    width=480, height=480)

ggplot(m1, aes(year, Emissions)) +
  geom_line() +
  geom_point() +
  ggtitle("Baltimore Motor Vehicle Emissions by Year") +
  xlab("Year") +
  ylab("Emissions")

dev.off()

#ANSWER: Big drop off from 1999 to 2002, then slowly continuously decreasing.