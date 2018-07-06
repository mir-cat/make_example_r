dir.create('raw_data', showWarnings = FALSE)

dat1 <- iris
write.csv(dat1, 'raw_data/raw_iris.csv')
