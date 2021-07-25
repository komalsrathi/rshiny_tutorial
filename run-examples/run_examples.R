# root directory of your project
root_dir <- rprojroot::find_root(rprojroot::has_dir(".git"))

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
runApp(appDir = file.path(root_dir, "03-widgets-io", "02-update-inputs"), display.mode = "showcase")
runApp(appDir = file.path(root_dir, "03-widgets-io", "03-output-elements"), display.mode = "showcase")
runApp(appDir = file.path(root_dir, "03-widgets-io", "04-update-outputs"), display.mode = "showcase")

# 04-add-scripts
runApp(appDir = file.path(root_dir, "04-add-scripts"), display.mode = "showcase")

# 05-rmarkdown-shiny
rmarkdown::run(file =  file.path(root_dir, "05-rmarkdown-shiny", "01-shiny-markdown.Rmd"))

# 06-flexdashboard
rmarkdown::run(file =  file.path(root_dir, "06-flexdashboard", "06-flexdashboard.Rmd"))

