library(magrittr)
library(gutenbergr)
library(tidyverse)
library(tidytext)
library(dplyr)
library(wordcloud)
library(RColorBrewer)
gutenberg_metadata %>%
  filter(title == "On the Origin of Clockwork, Perpetual Motion Devices, and the Compass")
book <- gutenberg_download(30001)

book_df <-book%>%unnest_tokens(word, text)

data(stop_words)
book_df <- book_df %>%
  anti_join(stop_words)
book_df<-book_df %>%
  count(word, sort = TRUE) 

book_df <-filter(book_df,!(word %in% c("_ca","de","pp","vol",	
                                       "a.d","1","al") ))


book_df%>% with(wordcloud(word, n, max.words = 50, random.order = FALSE, rot.per = 0.35, 
                             colors = brewer.pal(8, "Dark2")))


