list.files("/anvil/projects/tdm/data/craigslist")
myDF <- read.csv("/anvil/projects/tdm/data/craigslist/vehicles.csv", stringsAsFactors = TRUE)
file.info("/anvil/projects/tdm/data/craigslist/vehicles.csv")$size

# Q1
options(repr.matrix.max.cols=25, repr.matrix.max.rows=200)
options(jupyter.rich_display = F)
head(myDF)
str(myDF$id)
str(myDF$url)
str(myDF$region)
length(table(myDF$region))
unique(myDF$region)
table(myDF$year)
table(myDF$year[myDF$year >= 2011])
length(myDF$year[(myDF$year >= 2011) & (!is.na(myDF$year))])
summary(myDF$year)
table(sort(myDF$year, decreasing=TRUE))
# create user defined mode function
mode <- function(vector) {
    uniqv <- unique(vector)
    uniqv[which.max(tabulate(match(vector, uniqv)))]
    }

mode(myDF$year)


#Q2
table(myDF$condition, useNA = "always")
myDF$newflag <- NA
myDF$newflag[myDF$condition == "like new"] <- TRUE
myDF$newflag[myDF$condition != "like new"] <- FALSE
table(myDF$newflag, useNA = "always")
head(myDF, n=1)
myDF$pricecategory <- NA
myDF$pricecategory[myDF$price <= 1500] <- "cheap"
myDF$pricecategory[(myDF$price > 1500) & (myDF$price <= 10000)] <-"average"
myDF$pricecategory[myDF$price > 10000] <- "expensive"
table(myDF$pricecategory, useNA = "always")
mode(myDF$pricecategory)


#Q3
table(myDF$newflag, useNA = "always")
myDF$newpricecategory <- cut(myDF$price, breaks = c(-Inf, 1500, 10000, Inf), labels = c("cheap", "average", "expensive"))
table(myDF$newpricecategory, useNA = "always")
table(myDF$pricecategory, useNA = "always")
# check if the values are the same
# if we set new vector with false value for when values of two elements are the same
# this new vector will have true value only for those that are not a match.
sum(myDF$newpricecategory != myDF$pricecategory)
myDF$odometerage <- cut(myDF$odometer,
                        breaks = c(-Inf, 50000, 100000, Inf),
                        labels = c("new", "middle age", "old"))
table(myDF$odometerage, useNA = "always")


#Q4
myIndy <- subset(myDF, region=="indianapolis")
tail(sort(table(myDF$region)))
popularRegion <- subset(myDF, region=="springfield")
dim(popularRegion)
# check what's inside region column
table(myDF$region)
saintRegion <- subset(myDF,
                      (grepl("st ", region, fixed = TRUE) == TRUE) 
                      & (grepl("west", region, fixed = TRUE) == FALSE) 
                      & (grepl("east", region, fixed = TRUE) == FALSE)
                     )
myV <- table(saintRegion$region)
# check if I made this list correctly
head(myV[myV != 0], n=403)


#Q5
library(leaflet)
library(sf)
options(jupyter.rich_display = T)
addCircleMarkers(addTiles(leaflet(myIndy)), radius=1)
addCircleMarkers(addTiles(leaflet(popularRegion)), radius=1)
addCircleMarkers(addTiles(leaflet(saintRegion)), radius=1)