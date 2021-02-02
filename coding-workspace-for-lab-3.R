
# load packages -----------------------------------------------------------

library(tidyverse)

# firefly spermantophore masses -------------------------------------------
firefly_mass <- read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q19FireflySpermatophoreMass.csv")
firefly_mass
ggplot(data = firefly_mass) +
  geom_histogram(mapping = aes(x = spermatophoreMass), bins = 10,
                 boundary = 0, closed = "left", 
                 fill = "#8250e5", color = "black") +
  labs(x = "Spermatophore Mass", y = "Frequency (Number of Individuals") +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1)),
    axis.text.x = element_text(angle = 45, hjust = 1),
  )

# bird orders -------------------------------------------------------------
library(auk)        
birds <- ebird_taxonomy %>%
  as_tibble() %>%
  filter(category == "species")
birds
count(birds)
count(birds,order)
distinct(birds, order)
count(birds,order)
ggplot(data = birds) +
  geom_bar(mapping = aes(x = fct_infreq(order)), fill = "#c5351B",
           width = .75) +
  labs(x = "Orders", y = "Number of Species") +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(.9)),
    axis.text.x = element_text(angle = 90, hjust = 1),
    axis.ticks.x = element_blank()
  )