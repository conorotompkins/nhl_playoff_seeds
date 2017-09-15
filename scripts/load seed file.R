
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
