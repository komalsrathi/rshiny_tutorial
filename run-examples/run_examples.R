# root directory of your project
root_dir <- file.path("/Users/rathik/Projects/rshiny_tutorial")

# 01-architecture
runApp(appDir = file.path(root_dir, "01-architecture", "01-ui-server-scripts"), display.mode = "showcase")
runApp(appDir = file.path(root_dir, "01-architecture", "02-app-script"), display.mode = "showcase")

# 02-layouts
runApp(appDir = file.path(root_dir, "02-layouts", "01-sidebar_layout"), display.mode = "showcase")
runApp(appDir = file.path(root_dir, "02-layouts", "02-grid_layout"), display.mode = "showcase")
runApp(appDir = file.path(root_dir, "02-layouts", "03-segmented_navlists_layout"), display.mode = "showcase")
runApp(appDir = file.path(root_dir, "02-layouts", "04-segmented_tabs_layout"), display.mode = "showcase")
runApp(appDir = file.path(root_dir, "02-layouts", "05-navbarpage"), display.mode = "showcase")
runApp(appDir = file.path(root_dir, "02-layouts", "06-shinydashboard"), display.mode = "showcase")

# 03-widgets-io
runApp(appDir = file.path(root_dir, "03-widgets-io", "01-input-widgets"), display.mode = "showcase")
runApp(appDir = file.path(root_dir, "03-widgets-io", "02-output-elements"), display.mode = "showcase")
runApp(appDir = file.path(root_dir, "03-widgets-io", "03-update-io"), display.mode = "showcase")

# 04-add-scripts
# function for fancy datatable
# function to plot correlation using two input variables and return two objects

# 05-rmarkdown-shiny

# other topics: 
# creating a shiny server
# publishing or deploying your app on an internal server or shinyapps.io

