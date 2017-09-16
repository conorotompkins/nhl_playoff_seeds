library(tidyverse)
library(stringr)


#data starts at 20072008
theme_set(theme_bw())

rm(list = ls())

data <- read_tsv("data/nhl_playoff_results.txt")

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
  
levels_season <- unique(as.character(df$season))

df <- df %>% 
  mutate(season = factor(season, levels = levels_season))

df %>% 
  count(wins, losses) %>% 
  ggplot(aes(wins, losses, fill = n)) +
  geom_tile() +
  coord_equal() +
  scale_x_continuous(expand = c(0,0),
                     breaks = 0:16) +
  scale_y_continuous(expand = c(0,0), 
                     breaks = 0:16) +
  theme(panel.grid = element_blank())
