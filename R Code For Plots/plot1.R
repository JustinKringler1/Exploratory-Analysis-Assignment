#Library
library(dplyr)
library("ggplot2")

# Download files from:
# "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
# and put in your working directory

# Reading in datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

############################ Question 1 ########################################
# Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008? Using the base plotting system, make a plot
# showing the total PM2.5 emission from all sources for each of the
# years 1999, 2002, 2005, and 2008.
################################################################################

# Calculating total emissions for each year
c1 <-round(sum(NEI$Emissions[NEI$year=="1999"]))
c2 <-round(sum(NEI$Emissions[NEI$year=="2002"]))
c3 <-round(sum(NEI$Emissions[NEI$year=="2005"]))
c4 <-round(sum(NEI$Emissions[NEI$year=="2008"]))

# Assigning x and y values to plot
x <- c(1999,2002,2005,2008)
y <- c(c1,c2,c3,c4)

# Saving plot
png(file="C:/Users/cc13m/OneDrive/Desktop/Data Science Resources/Exploratory_Data_Analysis/Assignment2/plot1.png",
    width=480, height=480)

# Plotting question 1
plot(x = x,y = y,
     type = "p",
     lwd = 4,
     col = "blue",
     xlab = "Year",
     ylab = "Emissions (Tons)",
     main = "Total Emissions for Years: 1999, 2002, 2005, and 2008")
lines(x,y, lwd = 2)
text(x = 1999, y = c1, labels = c1, cex = .8, font = 2, pos = 4)
text(x = 2002, y = c2, labels = c2, cex = .8, font = 2, pos = 1)
text(x = 2005, y = c3, labels = c3, cex = .8, font = 2, pos = 3)
text(x = 2008, y = c4, labels = c4, cex = .8, font = 2, pos = 2)

dev.off()
# ANSWER: Yes, as we can see by the plot, emissions have been decreasing from
# 1999-2008

