# load ggplot2, iris, and mtcars
# scatterplot           (mtcars: mpg vs wt)
# histogram             (mtcars: mpg) and change binwidth
# scatterplot w/ colors (iris: Sepal.Width vs Sepal.Length, color by Species)
# non aesthetic color   (iris: Sepal.Width vs Sepal.Length, red points)
# regression line       (mtcars: mpg vs wt)
# multiple lines        (iris: Sepal.Width vs Sepal.Length, color by Species)
# bar chart             (iris: Species, fill by Species)
# boxplots              (iris: Sepal.Length vs Species)
# facets                (same graph from multiple lines, facet by Species)

library(ggplot2)
data("iris")
data("mtcars")

# simple scatterplot
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# histogram
ggplot(mtcars, aes(x = mpg)) + geom_histogram(binwidth = 5)

# scatterplot with colors
ggplot(iris, aes(x = Sepal.Width, y = Sepal.Length, color = Species)) +
  geom_point()
