
# 01. Architecture

Separate `ui.R` and `server.R`:

```
01-architecture/example-1
├── code # all .R scripts go here
├── input # input files
├── output # output files
├── server.R # update outputs using some input variable or by calling functions
├── ui.R # define layout, input and output elements
├── www # files like .css, .js, .png
└── ... # any number of directories or organization folders
```

ui and server in a single `app.R`:

```
01-architecture/example-2
├── app.R # combines ui and server in one script
└── ... # add similar directories as shown above
```

# 02. Layouts

In this section we will talk about how to arrange the shiny components i.e. inputs and outputs. These are the following types of most commonly used layouts: 

### Sidebar layout

This is the most basic layout and is called by the function `sidebarLayout` and has two components: a side bar panel (`sidebarPanel`) which is used to lay out all the input components and a main panel (`mainPanel`) which is used to lay out the output components. There are two parameters to define the size and position:
- `width`: This is a panel-specific parameter. The combined width of sidebarPanel and mainPanel cannot exceed 12.
- `position`: This is a sidebarLayout parameter. Allowed values: `left` or `right` 

### Custom layout

Shiny's grid system using combinations of rows (`fluidRow`) & columns (`column`). This layout is used to better organize the inputs and outputs.

### Segmented layout

Using tabs (`tabsetPanel`) or menu items (`navlistPanel`) functions

### Navbarpage layout

### Dashboards

