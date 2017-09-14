library(tidyverse)
library(stringr)

data <- read_tsv("nhl_playoff_results.txt")

colnames(data) <- tolower(colnames(data))


df <- data %>%
  mutate(gp = wins + losses,
         team = str_sub(teamseason, 1, 3),
         season = as.character(season)) %>% 
  select(-teamseason) %>% 
  group_by(team, season) %>% 
  summarize(wins = sum(wins),
            losses=  sum(losses),
            gp = sum(gp))
  
levels_season <- unique(df$season)
