library(tidyverse)
library(stringr)

theme_set(theme_bw())

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
  
levels_season <- unique(df$season)

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

?ls

read_csv("data/playoff_seeding/20162017", skip = 2)
?read_csv

rm(list = ls())
data_path <- "./data/playoff_seeding"
data_list <- list.files(path = data_path)
?list.files
data_list <- paste0(data_path, "/", data_list)
data_list <- lapply(data_list, read_csv)

#for (i in seq_along(data_list)) {
#  data_list[[i]]$season <- levels_season[[i]]
#}



playoff_seeding <- bind_rows(data_list)

df_seasons <- tibble(season = levels_season)

colnames() <- tolower(colnames(data))
colnames(data) <- gsub(" ", "_", colnames(data))
