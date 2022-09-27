 myDF <- read.csv("/anvil/projects/tdm/data/election/escaped/itcont2020sample.txt", sep="|")

# Q1
head(myDF)
class(myDF$TRANSACTION_DT)
library(lubridate)
myDF$newdates <- mdy(myDF$TRANSACTION_DT)
class(myDF$newdates)
head(myDF$newdates, n = 25)

# tapply will sum TRANSCATION_AMT based on the newdates category.
myresult <- tapply(myDF$TRANSACTION_AMT, myDF$newdates, sum)
table(head(sort(myDF$TRANSACTION_AMT, decreasing=TRUE), n=25))
length(sort(unique(myDF$newdates)))

# sort will align dots when plotting the myresult
plot(sort(unique(myDF$newdates)), myresult)


# Q2
newDF <- subset(myDF, (newdates >= mdy("01/01/2019"))
                    & (newdates <= mdy("05/15/2019"))
               )

mynewresult <- tapply(newDF$TRANSACTION_AMT, newDF$newdates, sum)

tail(sort(mynewresult))

length(sort(unique(newDF$newdates)))

length(mynewresult)

plot(sort(unique(newDF$newdates)), mynewresult)


# Q3
stateresult <- tapply(myDF$TRANSACTION_AMT, myDF$STATE, sum)

# categorized sum of donations by states
stateresult

head(myDF$CITY)
head(myDF$STATE)

# paste() will pair up two parameters seperated by a regex (=sep)
myDF$citystatepair <- paste(myDF$CITY, myDF$STATE, sep=", ")

cityDonations <- tapply(myDF$TRANSACTION_AMT, myDF$citystatepair, sum)

head(sort(cityDonations, decreasing=TRUE), n=55)
tail(sort(cityDonations, decreasing=TRUE), n=55)


# Q4
# comma seperated names
head(myDF$NAME, n=55)
class(myDF$NAME)

sum(grepl(", DON", head(myDF$NAME, n=55)))
sum(grepl("ISABELLE", myDF$NAME))
sum(myDF$TRANSACTION_AMT[grepl("ISABELLE", myDF$NAME)])
sum(myDF$TRANSACTION_AMT[grepl("MARY", myDF$NAME)])



# Q5
head(sort(myDF$EMPLOYER), n=50)
tail(sort(myDF$EMPLOYER), n=50)

sum(myDF$TRANSACTION_AMT[myDF$EMPLOYER == "NOT EMPLOYED"], na.rm=TRUE)
employed <- sum(myDF$TRANSACTION_AMT[myDF$EMPLOYER == "EMPLOYED"], na.rm=TRUE)
notemployed <- sum(myDF$TRANSACTION_AMT[(myDF$EMPLOYER != "NOT EMPLOYED") & (myDF$EMPLOYER != "NONE")], na.rm=TRUE)

tempV <- c(notemployed, employed)

tempV
names(tempV) <- c("NOT EMPLOYED", "EMPLOYED")

barplot(tempV)

head(sort(tapply(myDF$TRANSACTION_AMT, myDF$OCCUPATION, sum), decreasing=TRUE), n=55)

head(newDF$STATE[grepl("", newDF$OCCUPATION)])

barplot(sort(tapply(newDF$TRANSACTION_AMT[grepl("FOUNDER | PRESIDENT | CEO | CHAIRMAN", newDF$OCCUPATION)]
                   , newDF$STATE[grepl("FOUNDER | PRESIDENT | CEO | CHAIRMAN", newDF$OCCUPATION)]
                   , sum
                   )
            )
       )
