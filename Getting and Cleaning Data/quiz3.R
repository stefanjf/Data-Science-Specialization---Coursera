setwd("/Volumes/WD750/GoogleDrive/Programming/Coursera/Getting and Cleaning Data")

#Question 1 
#125, 238,262
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(URL, destfile = "data.csv", method="curl")
data <- read.csv('data.csv', header = TRUE)

which(with(data, ACR == 3 & AGS == 6))

#OR
agricultureLogical <- data$ACR == 3 & data$AGS == 6
which(agricultureLogical)[1:3]

#Question 2
#-15259150 -10575416
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg', destfile = "jeff.jpg", method='curl')
library(jpeg)
img <- readJPEG('jeff.jpg', native = TRUE)
quantile(img, c(0.3, 0.8))

#Question 3
#189 matches, 13th country is St. Kitts and Nevis
gdp <- read.csv('getdata-data-GDP.csv', header = TRUE)
edu <- read.csv('getdata-data-EDSTATS_Country.csv', header = TRUE)

library(plyr) 
gdp <- rename(gdp,c('X'='CountryCode'))
gdp <- gdp[!(gdp$CountryCode == ""), ]
edu <- edu[!(gdp$CountryCode == ""), ]

mergedData <- merge(gdp, edu, by="CountryCode")
mergedData <- mergedData[order(mergedData$Gross.domestic.product.2012),]

#Question 4
#
mergedData[mergedData == ""] <- NA
mergedData$Gross.domestic.product.2012 <- as.numeric(mergedData$Gross.domestic.product.2012, na.omit=TRUE)

mergedData[complete.cases(mergedData[,mergedData$Gross.domestic.product.2012]),] 
rank <- mergedData[mergedData$Income.Group == 'High income: nonOECD',]$Gross.domestic.product.2012
mean(rank, na.rm=TRUE)
