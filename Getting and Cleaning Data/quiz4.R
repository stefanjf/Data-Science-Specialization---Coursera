library(dplyr)
library(tidyr)

#Question 1
idahoData <- read.csv("idahodata.csv")
idahoData <- tbl_df(idahoData)
dataNames <- strsplit(names(idahoData), "wgtp")
dataNames[123]

#Question 2
gdpData <- tbl_df(read.csv("getdata-data-GDP.csv"))

cleanData <- gdpData %>%
    select(X.3) %>%
    na.omit %>%
    filter(X.3 != "" & X.3 != "..") %>%
    slice(3:192) %>%
    mutate(gdp = as.numeric(as.character(gsub(",","", X.3)))) %>%
    print

mean(cleanData$gdp)

#Question 3
grep("^United",gdpData$X.2)

#Question 4
gdp <- read.csv("getdata-data-GDP.csv", header = TRUE)
edu <- read.csv("getdata-data-EDSTATS_Country.csv")
gdp <- rename(gdp,c('X'='CountryCode'))
joinedData <- inner_join(gdpData, eduData, by="CountryCode")
mergedData <- merge(gdpData, eduData, by="CountryCode")

#Question 5
library(quantmods)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
dates <- ymd(sampleTimes)
table(year(dates))
table(wday(dates), year(dates))
