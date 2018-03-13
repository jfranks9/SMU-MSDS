# Pulling from online
url <- 'http://www.imdb.com/title/tt1201607/fullcredits?ref_=tt_ql_1'
webpage<- read_html(url)
# Identifying HTML nodes
Actor_table<-html_nodes(webpage, '.itemprop')
Actor<-html_text(Actor_table)
Character_table<-html_nodes(webpage, '.character')
Character<-html_text(Character_table)
# Converting scraped text to Data Frame
ActDF<-data.frame(Actor)
CharDF<-data.frame(id=1:length(Character),Character)
colnames(ActDF)[1] <- "Name"
#Cleaning Character Data
Char <- CharDF[1:92,]
Char <- lapply(Char, gsub, pattern='\n', replacement='')
Char <- lapply(Char, trimws)
Char <- lapply(Char, gsub, pattern='\\s+', replacement=' ')
CharF <-data.frame(id=1:length(Char$Character),Character=Char$Character)
#Cleaning Actor Data
Credits <- ActDF[1:182,]
toDelete <- seq(1, length(Credits), 2)
Credits <- Credits[-toDelete]
id<-length(Credits)
Credits <- data.frame(id=1:id, Name=Credits)
clean<-Credits %>%
  # After splitting this way, I want the last 'word' from each column
  separate(Name, into=c("FirstName", "SurName"),sep="[ ](?=[^ ]+$)")
#Merging Character and Actors
total <- merge(clean,CharF, by='id')
Final<- total[,2:4]
#Print the first 10 rows
head(Final,10)