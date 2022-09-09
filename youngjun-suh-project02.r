
MyDF <- read.csv("/anvil/projects/tdm/data/flights/subset/1995.csv", stringsAsFactors = TRUE)


dim(MyDF)


head(MyDF)


tail(MyDF)


summary(MyDF)


summary(MyDF$ArrDelay)


class(MyDF)


class(MyDF$ArrDelay)
      

str(MyDF)


head(MyDF$Origin)


tail(MyDF$Origin)


head(MyDF$Origin, n = 250)


tail(MyDF$Origin, n = 250)


table(MyDF$Origin)


sort(table(MyDF$Origin))


sort(table(MyDF$Origin), decreasing=TRUE)


tail(sort(table(MyDF$Origin)))


tail(sort(table(MyDF$Origin), decreasing=TRUE))


head(sort(table(MyDF$Origin)))


table(MyDF$Origin)["ORD"]


myAirports <- MyDF$Origin


class(myAirports)


head(myAirports, n = 250)


table(head(myAirports, n = 250))


table(head(myAirports, n = 250))["ORD"]


table(myAirports)["ORD"]


table(myAirports)["IND"]


table(MyDF$Dest)["IND"]


MyDF[894,]


summary(MyDF$Distance)


head(MyDF$Distance[MyDF$Distance < 200], n = 100)


head(MyDF$Origin[MyDF$Distance < 200], n = 100)


head(MyDF$Dest[MyDF$Distance < 200], n = 100)


length(MyDF$Distance[MyDF$Distance < 200])


sum(MyDF$Distance < 200, na.rm=TRUE)


head(MyDF$Distance < 200)


length(MyDF$Distance[MyDF$Distance < 200]) - sum(MyDF$Distance < 200, na.rm=TRUE)


sort(table(MyDF$UniqueCarrier), decreasing=TRUE)


head(sort(table(MyDF$UniqueCarrier), decreasing=TRUE), n=3)


head(sort(table(MyDF$TailNum), decreasing=TRUE), n=11)


plot(table(MyDF$UniqueCarrier[MyDF$Distance < 200]))
# short distance travel


plot(table(MyDF$UniqueCarrier[MyDF$Distance > 500 && MyDF$Distance < 1000]))
# medium distance travel


sort(table(MyDF$UniqueCarrier[MyDF$Distance > 500 && MyDF$Distance < 1000]))
# double checking the numbers


plot(table(MyDF$UniqueCarrier[MyDF$Distance > 1500]))
# long distance travel


dotchart(table(MyDF$UniqueCarrier[MyDF$Distance > 1500]))