## NOT WORK
require(utils)
require(RCurl)
url = 'https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2'
data <- download.file(url, destfile='StormData.csv', method='curl')

url = 'https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2'
data = getURL(url, ssl.verifypeer=FALSE)

url = 'https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2'
data = read.csv(file=url) #, ssl.verifypeer=FALSE
## NOT WORK  ########################################################


data = read.csv(bzfile('repdata-data-StormData.csv.bz2'))
dim(data)

str(data)
summary(data)

# harmful for population health 
max(data$FATALITIES)
data[data$FATALITIES==583,]

max(data$INJURIES)
data[data$INJURIES=1700,]

hist(data$FATALITIES)
hist(data$INJURIES)

> mean(data$INJURIES)
[1] 0.1557447
> median(data$INJURIES)
[1] 0
> mean(data$FATALITIES)
[1] 0.01678494
> median(data$FATALITIES)
[1] 0

count for NA elements


# for greatest economic consequences
max(data$PROPDMG)
max(data$CROPDMG)
##############


```
