library(stringr)
library(tidyverse)

data_path <- "./data/playoff_results"

data_list <- list.files(path = data_path)

seasons <- paste(data_list)

data_list <- paste0(data_path, "/", data_list)

data_list <- lapply(data_list, read_csv)


names(data_list) <- seasons

names(data_list)

for (i in seq_along(data_list)) {
  x <- nrow(data_list[[i]])
  data_list[[i]] <- data_list[[i]][2:x,]
}



df_playoff_results <- bind_rows(data_list, .id = "season")

colnames(df_playoff_results) <- tolower(colnames(df_playoff_results))
  
df_playoff_results <- df_playoff_results %>% 
  rename(rank = rk,
         wins = w,
         losses = l,
         ties = t,
         wins_overtime = ow,
         losses_overtime = ol,
         win_percentage = `w-l%`,
         gf = g) %>% 
  filter(team != "League Average")
