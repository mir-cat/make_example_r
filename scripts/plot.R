dir.create('plots', showWarnings = FALSE)

suppressWarnings(library(ggplot2))
suppressMessages(library(dplyr))
suppressWarnings(library(tidyr))

dat <-
  list(mtcars = read.csv('data/edit_mtcars.csv'),
       iris = read.csv('data/edit_iris.csv')
       )

p1 <-
  dat$mtcars %>%
  group_by(cyl) %>%
  summarise(hp = mean(hp)) %>%
  ggplot() +
  geom_col(aes(as.factor(cyl), hp, fill = as.factor(cyl)), data = dat$mtcars)

p2 <-
  dat$mtcars %>%
  ggplot(aes(x = wt, y = mpg)) +
  geom_point(aes(color = as.factor(cyl)))

p3 <-
  dat$iris %>%
  gather(measure, value, 1:4) %>%
  ggplot() +
  geom_boxplot(aes(Species, value, fill = Species)) +
  facet_wrap(~measure, scales = 'free_y')

pdf('plots/plots.pdf')
p1
p2
p3
dev.off()
