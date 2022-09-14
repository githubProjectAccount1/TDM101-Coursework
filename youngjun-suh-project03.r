options(jupyter.rich_display = F)
list.files("/anvil/projects/tdm/data/disney")
myDF <- read.csv("/anvil/projects/tdm/data/disney/7_dwarfs_train.csv", stringsAsFactors = TRUE)
file.info("/anvil/projects/tdm/data/disney/7_dwarfs_train.csv")$size

# Q1
dim(myDF)
str(myDF)
class(myDF$date)
class(myDF$datetime)
class(myDF$SACTMIN)
class(myDF$SPOSTMIN)
head(myDF, n=21)
# Q2
table(myDF$SPOSTMIN, useNA="always")
summary(myDF$SPOSTMIN)
head(is.na(myDF$SPOSTMIN), n=21)
newDF <- subset(myDF, !is.na(myDF$SPOSTMIN))
head(newDF, n=21)
# Q3
length(myDF$date[myDF$date=="12/28/2021"])
mean(myDF$SACTMIN[myDF$date=="12/25/2021"], na.rm=TRUE)
mean(myDF$SACTMIN[myDF$date=="07/26/2021"], na.rm=TRUE)
mean(myDF$SPOSTMIN[myDF$date=="12/28/2021"], na.rm=TRUE)
mean(myDF$SPOSTMIN[myDF$date=="01/01/2021"], na.rm=TRUE)
mean(myDF$SPOSTMIN[myDF$date=="08/15/2021"], na.rm=TRUE)
head(sort(table(myDF$date), decreasing=TRUE))
# Q4
length(myDF$SPOSTMIN)
length(newDF$SPOSTMIN)
myhours <- (newDF$SPOSTMIN + myDF$SPOSTMIN)/60
myDF$SPOSTMIN[313997]/60
newDF$SPOSTMIN[313997]/60 
# no more data and result in returning the first data (like how overflow happens in JAVA) and This is called recycling in R
# This is probably the reason why the warning message also said length of one object is not the multiple of that of the other.
# This means that if it were to be the multiple of the other,
# then R will calculate these objects as if the longer object is a collection of multiple objects with length of shorter one.
myhours[313997]
# Q5
library(lubridate)
myDF$weekday <- wday(myDF$datetime, label=TRUE)
head(myDF)
mean(myDF$SACTMIN[myDF$weekday == "Mon" & myDF$SACTMIN != -92918], na.rm=TRUE)
head(sort(myDF$SACTMIN))
mean(myDF$SACTMIN[myDF$weekday == "Tue" & myDF$SACTMIN != -92918], na.rm=TRUE)
mean(myDF$SACTMIN[myDF$weekday == "Wed" & myDF$SACTMIN != -92918], na.rm=TRUE)
mean(myDF$SACTMIN[myDF$weekday == "Thu" & myDF$SACTMIN != -92918], na.rm=TRUE)
mean(myDF$SACTMIN[myDF$weekday == "Fri" & myDF$SACTMIN != -92918], na.rm=TRUE)
mean(myDF$SACTMIN[myDF$weekday == "Sat" & myDF$SACTMIN != -92918], na.rm=TRUE)
mean(myDF$SACTMIN[myDF$weekday == "Sun" & myDF$SACTMIN != -92918], na.rm=TRUE)
tapply(myDF$SACTMIN, myDF$weekday, mean, na.rm=TRUE)
tapply(myDF$SACTMIN[myDF$SACTMIN != -92918], myDF$weekday[myDF$SACTMIN != -92918], mean, na.rm=TRUE)
myresult <- tapply(myDF$SACTMIN[myDF$SACTMIN != -92918],
                   myDF$weekday[myDF$SACTMIN != -92918],
                   mean,
                   na.rm=TRUE)
plot(myresult)
dotchart(myresult)
myDF$month <- month(myDF$datetime, label=TRUE)
head(myDF)
tapply(myDF$SACTMIN[myDF$SACTMIN != -92918],
                   myDF$month[myDF$SACTMIN != -92918],
                   mean,
                   na.rm=TRUE)
myresult02 <- tapply(myDF$SACTMIN[myDF$SACTMIN != -92918],
                   myDF$month[myDF$SACTMIN != -92918],
                   mean,
                   na.rm=TRUE)
plot(myresult02)
dotchart(myresult02)