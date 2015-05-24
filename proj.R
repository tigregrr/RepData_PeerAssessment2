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


data = read.csv(bzfile('repdata-data-StormData.csv.bz2'), header=T, 
                na.strings=c("", "NA"))
dim(data)
#[1] 902297     37

####
data_ <- data[,-37]
data_ <- unique(data_)
dim(data_)


data$BGN_DATE <- as.Date(data$BGN_DATE, "%m/%d/%Y")

tidy <- data_[,c(2,5,7,8,23,24,25,26,27,28)]

dmg <- rbind(tidy[tidy$FATALITIES > 500 ,], 
                tidy[tidy$INJURIES > 500 ,],
                tidy[tidy$PROPDMGEXP %in% "B",],
                tidy[tidy$CROPDMGEXP  %in% "B",])
summary(dmg[,c(4,5,6,7,8,9)])

t <- dmg
t <- apply(t, 1, function(x){ifelse(x=="K", 1000, x)})
t <- apply(t, 1, function(x){ifelse(x=="M", 1000000, x)})
t <- apply(t, 1, function(x){ifelse(x=="B", 1000000000, x)})

t[is.na(t)] <- 1
t <- t(t)
t <- as.data.frame(t)


t$tot.harm <- as.numeric(levels(t$FATALITIES)[t$FATALITIES]) +
                as.numeric(levels(t$INJURIES)[t$INJURIES])


t$tot.dmg <- as.numeric(levels(t$PROPDMG)[t$PROPDMG]) * 
            as.numeric(levels(t$PROPDMGEXP)[t$PROPDMGEXP]) +
            as.numeric(levels(t$CROPDMG)[t$CROPDMG]) * 
            as.numeric(levels(t$CROPDMGEXP)[t$CROPDMGEXP])

summary(t[,c(11,12)])

top.date <- t[order(t$BGN_DATE),]

top.harm <- t[order(-t$tot.harm),]

top.dmg <- t[order(-t$tot.dmg),]

View(t)

# DONE...!!!

## Sanitizing  ## ## Sanitizing  ## ## Sanitizing  ## ## Sanitizing  ## 
**sanitizing** 
    So, before of make a variable analysis, it is performed a sanitizing
of the working variables involved. 


Identifying **blank values**, **NA**, and **NULL** in the working sub-dataframe.

```{r, echo=TRUE, cache=TRUE}
tidy.fat.inj <- data[,c(23,24)]
na.id <- apply(tidy.fat.inj, 1, function(x){{any(is.na(x))}})
total.na <- sum(na.id)
total.na
```

Identifying **blank values**, **NA**, and **NULL** in the working sub-dataframe.

```{r, echo=TRUE, cache=TRUE}
tidy.pro.dam <- data[,c(25,26,27,28)]
na.id <- apply(tidy.pro.dam, 1, function(x){{any(is.na(x))}})
total.na <- sum(na.id)
total.na
```

```{r, echo=TRUE, cache=TRUE}
tidy.pro.dam <- data[,c(26,28)]
na.id <- apply(tidy.pro.dam, 1, function(x){{any(is.na(x))}})
total.na <- sum(na.id)
total.na
```

The property and crop damage columns do not have blank, NA, or NULL values. 
The property and crop damage extension columns also do not have NA or NULL 
values, but they have blank values. 

.







