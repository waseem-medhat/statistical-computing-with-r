# load the package dplyr
library(dplyr)

# load and examine the dataset iris
data("iris")
head(iris)
str(iris)

# select/remove variables
iris %>% 
  select(Species)

iris %>%
  select(-Sepal.Length, -Sepal.Width)

# filter rows using comparison tests
iris %>%
  filter(Species == "setosa")

iris %>%
  filter(Species == "setosa" & Sepal.Length > 5)

# compute  variables
iris %>%
  mutate(both = Sepal.Length + Sepal.Width)

iris %>%
  mutate(Sepal.Length = (Sepal.Length - mean(Sepal.Length)) / sd(Sepal.Length))
  
# summary statistics & grouped summaries
iris_new <- iris %>%
  group_by(Species) %>%
  summarize(mean_sepal_length = mean(Sepal.Length),
            mean_sepal_width  = mean(Sepal.Width)) %>%
  arrange(desc(mean_sepal_length))
