library(shiny)

# root directory of your project
root_dir <- file.path("/Users/rathik/Projects/rshiny_tutorial/")

# path to directory that has ui.R and server.R 
# preferred method
# keeps ui and server scripts separate - is much cleaner to look and debug
shiny::runApp(appDir = file.path(root_dir, '01-architecture', '01-ui-server-scripts'))

# path to directory that has a single app.R containing ui and server functions
# this method is not recommended as the code can get messy and hard to understand
shiny::runApp(appDir = file.path(root_dir, '01-architecture','02-app-script'))

