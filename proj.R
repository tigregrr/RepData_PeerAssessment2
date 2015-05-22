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
#[1] 902297     37
str(data)
summary(data)


da <- data[,c(2,7,8,22,23,24,25,26,27,28)]

> max(da$PROPDMG)
[1] 5000
> unique(da$PROPDMGEXP)
Levels:  - ? + 0 1 2 3 4 5 6 7 8 B h H K m M

> max(da$CROPDMG)
[1] 990
unique(da$CROPDMGEXP)
Levels:  ? 0 2 B k K m M

da.b <- da[(da$PROPDMGEXP=='B')|da$CROPDMGEXP=='B',]
View(da.b)

# identify
I prefer following way to check whether rows contain any NAs:
    
    row.has.na <- apply(final, 1, function(x){any(is.na(x))})
This returns logical vector with values denoting whether there is any NA in a row. You can use it to see how many rows you'll have to drop:

sum(row.has.na)
and eventually drop them

final.filtered <- final[!row.has.na,]
For filtering rows with certain part of NAs it becomes a little trickier (for example, you can feed 'final[,5:6]' to 'apply'). Generally, Joris Meys' solution seems to be more elegant.


# replacement
interval.mean
for (i in 1:(length(da.full[,1]) )) {
    if (is.na(da.full$steps[i])) 
        da.full$steps[i] <- interval.mean
}

# identifying blank values

tidy.NA <- data[,c(22,23)]
na.identifier <- apply(tidy.NA, 1, function(x){ifelse(x=="", TRUE, FALSE)})
total.NA <- sum(na.identifier)
total.NA


tidy.NA <- data[,c(26,28)]
na.identifier <- apply(tidy.NA, 1, function(x){ifelse(x=="", 1, x)})
View(na.identifier)
