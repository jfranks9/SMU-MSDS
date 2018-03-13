# Pulling from online
url <- 'http://www.imdb.com/title/tt1201607/fullcredits?ref_=tt_ql_1'
webpage<- read_html(url)
# Identifying HTML nodes
Actor_table<-html_nodes(webpage, '.itemprop')
Actor<-html_text(Actor_table)
Character_table<-html_nodes(webpage, '.character')
Character<-html_text(Character_table)
# Converting to Data Frame
ActDF<-data.frame(Actor)
CharDF<-data.frame(Character)
#colnames(ActDF)[1] <- "Name"
#colnames(CharDF)[1] <- "Character"
Char <- CharDF[1:92,]
Char <- lapply(Char, gsub, pattern='\n', replacement='')
Char <- lapply(Char, trimws)
Char <- lapply(Char, gsub, pattern='\\s+', replacement=' ')
#subset
Credits <- ActDF[1:182,]
toDelete <- seq(1, length(Credits), 2)
Credits <- Credits[-toDelete]
Credits <- data.frame(Credits)
colnames(Credits)[1] <- "Name"
clean<-Credits %>%
    # After splitting this way, I want the last 'word' from each column
  separate(Name, into=c("FirstName", "SurName"),sep="[ ](?=[^ ]+$)")


Character_table<-html_nodes(webpage, '.character')
Character<-html_text(Character_table)
CharDF<-data.frame(Character)
Char <- CharDF[1:92,]
Char <- lapply(Char, gsub, pattern='\n', replacement='')
Char <- lapply(Char, trimws)
Char <- lapply(Char, gsub, pattern='\\s+', replacement=' ')
Char
lapply(Char, trimws)
lapply(Char, gsub, pattern='\n', replacement='')

separate(Name, into=c("FirstName", "SurName"),sep="[ ](?=[^ ]+$)")
a<- merge(ActDF,CharDF)