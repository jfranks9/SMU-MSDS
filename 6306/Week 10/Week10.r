#Load Libraries
library("dplyr")
library("ggplot2")
#Load Data - Part A
data<- read.csv("N-MHSS-2015-DS0001-data-excel.csv")
#Create list of state abbrivations - Part B
ULST <- unique(data)
#Filter Data to Veterens Affairs
VAdata <- subset(data,FACILITYTYPE==6)
#Remove Non-mainland states - Part C
VAdata <- subset(VAdata, LST !="GU")
VAdata <- subset(VAdata, LST !="AS")
VAdata <- subset(VAdata, LST !="VI")
VAdata <- subset(VAdata, LST !="PR")
VAdata <- subset(VAdata, LST !="HI")
VAdata <- subset(VAdata, LST !="AK")
#Create Frequency Table - Part C
dataf <- VAdata %>% group_by(LST) %>% summarise(Freq=n())
#create barplot - Part D
dataN=c('State','Counts')
colnames(dataf) <- dataN
g<-ggplot(dataf, aes(State, Counts))
g+geom_bar(stat = "identity", aes(fill=State))+xlab("State") + 
  ylab("Counts")+ggtitle("Number of VA Mental Health Clinics by State")+coord_flip()+
  theme(plot.title = element_text(hjust = 0.5))


####Problem 2
#Load Data - Part A
statesize <- read.csv("statesize.csv")
#Rename for merging
names(statesize)[names(statesize) == 'Abbrev'] <- 'State'
# paste() - Part A
paste(VAdata$LST)
#Merge - Part B
dataf2 <- merge(dataf,statesize,by="State")
#Create New variable - Part C
dataf2['FSM'] <- (dataf2$Counts)/ (dataf2$SqMiles/1000)
#create barplot - Part D
g2<-ggplot(dataf2, aes(State, FSM, Region))
g2+geom_bar(stat = "identity", aes( x= reorder(State, -FSM), fill=Region))+xlab("State") + 
  ylab("Number of Hospitals per Thousand Miles")+ggtitle("Number of VA Mental Health Clinics by State Per Thousand Miles")+coord_flip()+
  theme(plot.title = element_text(hjust = 0.5))
