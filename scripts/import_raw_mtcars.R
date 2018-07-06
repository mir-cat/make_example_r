dir.create('raw_data', showWarnings = FALSE)

dat <- mtcars
write.csv(dat, 'raw_data/raw_mtcars.csv')
