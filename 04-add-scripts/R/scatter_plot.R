library(ggplot2)
source('R/plot_theme.R')

scatter_plot <- function(data, x, y){
  # get correlation and p-value
  cor_res <- with(data = data, expr = cor.test(get(x), get(y)))
  text <- paste0("correlation: ", cor_res$estimate,
                 "\n",
                 "pvalue: ", cor_res$p.value)
  
  x_coord <- max(with(data, get(x)))
  y_coord <- mean(with(data, get(y)))
  
  # ggplot scatter plot
  ggplot(data = data, aes(get(x), get(y))) + 
    geom_point(pch = 21, color = 'darkred') +
    xlab(x) + ylab(y) +
    theme_publication() +
    annotate(geom = "text", label = text, x = x_coord, y = y_coord, hjust = "left")
  
}
