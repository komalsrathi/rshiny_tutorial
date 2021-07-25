source('R/scatter_plot.R')
source('R/box_plot.R')

custom_plot <- function(data, x, y){
  var <- with(data, get(x))
  print(class(var))
  if(class(var) == "numeric"){
    p <- scatter_plot(data = data, x = x, y = y)
  } else {
    p <- box_plot(data = data, x = x, y = y)
  }
  return(p)
}