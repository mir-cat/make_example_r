library(magrittr)
dir_name <- 'iris_models/'
fpath <- paste0('output/', dir_name)
dat <- read.csv('data/edit_iris.csv')

if (!dir.exists(fpath)) dir.create(fpath, recursive = TRUE)

models <-
  names(dat)[1:4] %>%
  purrr::set_names() %>%
  purrr::map(function(x) {
  fo <- as.formula(paste(x, '~ .'))
  lm(fo, data = dat)
})

purrr::iwalk(models, function(mod, nm) {
  saveRDS(mod, paste0(fpath, nm, '.rds'))
})
