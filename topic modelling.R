library(topicmodels)
library(gutenbergr)
library(tidyverse)
library(tidytext)

text <- gutenberg_metadata %>%
  filter(title == "On the Origin of Clockwork, Perpetual Motion Devices, and the Compass")
text <- gutenberg_download(30001)

unnesttoken_text <- text %>% 
  unnest_tokens(word, text)

data(stop_words)
tidy_books <- unnesttoken_text %>%
  anti_join(stop_words) %>%

  book_dtm <- book %>%
  unnest_tokens(word, text)%>%
  anti_join(stop_words) %>%
  count(gutenberg_id, word) %>%
  cast_dtm(gutenberg_id, word, n)


