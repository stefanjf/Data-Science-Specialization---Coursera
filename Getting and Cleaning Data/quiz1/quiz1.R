data = read.csv('data.csv')

data[data$VAL == "24"]

x <- subset(data, VAL == 24)
nrow(x)

library(xlsx)
dat <- read.xlsx("gas.xlsx", colIndex=7:15, rowIndex=18:23, sheetIndex=1)

sum(dat$Zip*dat$Ext,na.rm=T) 

require(data.table)
data=fread('rest.xml')

temp <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", ssl.verifyPeer=FALSE)
DFX <- xmlTreeParse(temp,useInternal = TRUE)

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
rootNode[[1]][[1]]
xpathSApply(rootNode, "//zipcode", xmlValue)
sum(xpathSApply(rootNode, "//zipcode", xmlValue)==21231)

xpathSApply(rootNode, "//zipcode", xmlValue)

DT <- fread('pid.csv')
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
            system.time(DT[,mean(pwgtp15),by=SEX])
                        system.time(mean(DT$pwgtp15,by=DT$SEX))
                                    system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
