library(tidyverse)
library(viridis)

rm(list = ls())

source("scripts/load_data.R")
source("scripts/load_seed_data.R")

df_team_abbr <- read_csv("data/NHL_team_names_abbr.csv")

df <- df_seeds %>% 
  left_join(df_team_abbr)

df

df_seeds

df <- df %>% 
  left_join(df_results) %>% 
  filter(season != "20052006", season != "20062007")
df

df %>% 
  count(rank, wins) %>% 
  ggplot(aes(rank, wins, fill = n)) +
  geom_tile() +
  scale_fill_viridis() +
  scale_x_continuous(expand = c(0,0), breaks = 1:16) +
  scale_y_continuous(expand = c(0,0)) +
  coord_equal() +
  theme(panel.grid = element_blank())
