#Library
library(dplyr)
library("ggplot2")

# Download files from:
# "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
# and put in your working directory


# Reading in datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

############################ Question 4 ########################################
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999-2008?
################################################################################

# Getting the name for coal and connecting it with the right shortname
SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC,]
totalCoal <- aggregate(Emissions ~ year + type, NEIcoal, sum)

# Creating Plot 4:
png(file="C:/Users/cc13m/OneDrive/Desktop/Data Science Resources/Exploratory_Data_Analysis/Assignment2/plot4.png",
    width=480, height=480)

ggplot(totalCoal, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle("Total US Coal Emission by Type and Year") +
  xlab("Year") +
  ylab(expression("US Coal Emission"))

dev.off()

# ANSWER: Relatively decreased but type "nonpoint" increase BEtween 2002-2005
# then went back to where it was in 1999 for 2008.