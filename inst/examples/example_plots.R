load('data/state_map.Rda')
load('data/sa2_map.Rda')
load('data/sa4_map.Rda')
load('data/elect_map.Rda')

library(tidyverse)
library(ochRe)


#Some example plots
state_map %>%
  ggplot() + geom_polygon(aes(long, lat, group = group),
                          fill = 'grey90',
                          colour = 'black') +
  theme_bw() + 
  coord_map()

elect_map %>%
  ggplot() +
  geom_polygon(aes(long, lat, group = group, fill = State)) +
  theme_bw() +
  scale_fill_ochre(palette = "namatjira_qual") +
  coord_map()

sa4_map %>%
  filter(State %in% c('VIC', 'NSW', 'ACT', 'TAS')) %>%
  ggplot() + geom_polygon(aes(long, lat, group = group, fill = pop)) +
  theme_bw() +
  coord_map()


