dir.create('data', showWarnings = FALSE)

dat <- read.csv('raw_data/raw_mtcars.csv')

names(dat)[names(dat) == 'X'] <- 'model'

write.csv(dat, 'data/edit_mtcars.csv')
