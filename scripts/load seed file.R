rm(list = ls())
data_path <- "./data/playoff_seeding"
data_list <- list.files(path = data_path)
data_list <- paste0(data_path, "/", data_list)
data_list <- lapply(data_list, read_csv)

#for (i in seq_along(data_list)) {
#  data_list[[i]]$season <- levels_season[[i]]
#}

for (i in seq_along(data_list)) {
  data_list[[i]] <- data_list[[i]][3:33, 1:2]
}

for(i in seq_along(data_list)) {
  colnames(data_list[[i]]) <- c("rank", "team")
}


team_seeds <- bind_rows(data_list) %>% 
  filter(team != "League Average")

df_seasons <- tibble(season = rep(levels_season, each = 30))

team_seeds <- bind_cols(team_seeds, df_seasons)

