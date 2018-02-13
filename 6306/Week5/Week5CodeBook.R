#Week 5

#Question 1

#Part a - import names list
df <- read.table(file="yob2016.txt", header= FALSE, sep=";")
colnames(df) = c("Name", "Sex", "N")
#Part b - show basic information
str(df)
summary(df)
#Part c - find duplicate/misspelled name
grep("*yyy", df$Name)
#Part d - delete duplicate name
y2016 <-df[-212,]

#Question 2

#Part a - read in second list
y2015 <- read.table(file="yob2015.txt", header= FALSE, sep=",")
colnames(y2015) = c("Name", "Sex", "N")
#Part b - Display last 10 names
tail(y2015, 10)
#Part c - Merge data sets
Final <- merge(y2015, y2016, by=c("Name", "Sex"))

#Question 3

#Part a - add name populations together
Final$Total <- rowSums(Final[,c("N.x","N.y")])
#Part b - sort by total and show top 10
Final <- Final[order(-Final$Total),]
head(Final,10)
#Part c - Filter to only girl names
Final <- Final[Final$Sex=="F",]
#Part d - Write top ten to csv
write.table(Final[0:10,c("Name","Total")],"Names.csv")