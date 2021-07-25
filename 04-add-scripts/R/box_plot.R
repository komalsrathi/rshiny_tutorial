library(ggplot2)
source('R/plot_theme.R')

box_plot <- function(data, x, y){

  # ggplot scatter plot
  ggplot(data = data, aes(get(x), get(y))) + 
    geom_boxplot() +
    xlab(x) + ylab(y) +
    theme_publication()

}
