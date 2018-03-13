# Pulling from online
url <- 'http://www.espn.com/nba/team/stats/_/name/sa/san-antonio-spurs'
webpage<- read_html(url)
# Identifying HTML nodes
SS_table<-html_nodes(webpage,xpath='//*[@id="my-players-table"]/div[3]/div[3]/table')
SS<-html_table(SS_table)
SS <-data.frame(SS)
SSH <- SS[2,]
SST <- SS[3:length(SS),]
colnames(SST) <- SSH
SST<-SST %>%
  separate(PLAYER, into=c("Name", "Position"),sep=",")
SST<-data.frame(SST)
col<-ncol(SST)
SST[,3:col] <- sapply(SST[,3:col], as.numeric)
#create barplot
data <- data.frame(SST$Name,SST$Position,SST$FG.)
dataN=c('Name', 'Position','FGP')
colnames(data) <- dataN
g<-ggplot(data, aes(Name,FGP))
g+geom_bar(stat = "identity", aes(fill=Position))



