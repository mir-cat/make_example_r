dir.create('data', showWarnings = FALSE)

dat <- read.csv('raw_data/raw_iris.csv')

dat <- dat[, names(dat) != 'X']

write.csv(dat, 'data/edit_iris.csv', row.names = FALSE)
