
# 1. Architecture

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

# 2. Layouts

In this section we will talk about how to arrange the shiny components i.e. inputs and outputs. These are the following types of most commonly used layouts: 

## 2.1. Fluid Page

The `fluidPage` function is used to create fluid page layouts. A fluid page layout consists of rows which in turn include columns. 

 ![fluidRow example](docs/fluidRow_example.png)

### 2.1.1 Sidebar layout

This is the most basic layout and is called by the function `sidebarLayout` and has three components: a title panel (`titlePanel`) used to add header or title to the application, side bar panel (`sidebarPanel`) which is used to lay out all the input components and a main panel (`mainPanel`) which is used to lay out the output components. There are two parameters to define the size and position:
- `width`: This is a panel-specific parameter. The combined width of sidebarPanel and mainPanel cannot exceed 12.
- `position`: This is a sidebarLayout parameter. Allowed values: `left` or `right` 

### 2.1.2 Grid layout

Shiny's grid system using combinations of rows (`fluidRow`) & columns (`column`). This layout is used to better organize the inputs and outputs. Rows (`fluidRow`) and Columns (`column`) define how the elements are organized horizontally and vertically. Rows exist for the purpose of making sure their elements appear on the same line. Columns exist for the purpose of defining how much width each element takes within a 12-unit wide grid.

### 2.1.3 Segmented layout

This uses Tabsets (`tabsetPanel`) or Navigation Lists (`navlistPanel`) to organize any kind of layout into discrete sections. Navigation lists can be used when you want to subdivide tabsets into sub-sections.

## 2.2. Navbar Pages

This allows for multiple sub-components: each with their own layout for e.g. sidebar, grid, tabsets etc. Here, instead of `fluidPage`, use `navbarPage`.

## 2.3. Dashboards
 
Dashboards can incorporate various layouts in one application similar to a `navbarPage` but more sophisticated. Shiny dashboards have three components: the header (`dashboardHeader`) used to add header or title to the application, the side bar (`dashboardSidebar`) which is used to lay out all the menu items and sub-items and the body (`dashboardBody`) which is used to lay out all the inputs and outputs using any of the above discussed layouts.

# 3. Inputs and Outputs

The goal of inputs is to provide a set of parameters that are passed on to a function which executes a set of commands in order to generate an output. In shiny jargon, inputs are called as `reactive sources` and outputs are called as `reactive endpoints`. 

## 3.1. Add inputs and outputs

Different types of input elements and their return values are listed below:

| Input            | Return value                                                   |
|------------------|----------------------------------------------------------------|
| Single checkbox  | Logical                                                        |
| Radio buttons    | Character                                                      |
| Select box       | Character or character vector (if `multiple = TRUE`)           |
| Numeric input    | Numeric                                                        |
| Text input       | Character string                                               |
| Checkbox group   | Character or character vector                                  |
| Picker input     | Character or character vector (select or deselect all at once) |
| Selectize input  | Character or character vector (add new elements)               |
| Slider input     | Numeric                                                        |
| Slider range     | Numeric vector                                                 |
| Date input       | Character                                                      |
| Date range input | Character vector                                               |
| File input       | Name, size, type and datapath                                  |
| Action button    | Numeric value (incremental)                                    |

## 3.2. Update outputs

Following are output-specific functions that take information from any number of inputs, perform computations (or call another function) and return either a table, plot, plotly or text object: 

| Output element (UI)       | Function (Server)    |
|---------------------------|----------------------|
| DT::dataTableOutput       | DT::renderDataTable  |
| shiny::plotOutput         | shiny::renderPlot    |
| plotly::plotlyOutput      | plotly::renderPlotly |
| shiny::textOutput         | shiny::renderText    |
| shiny::verbatimTextOutput | shiny::renderPrint   |

## 3.3 File I/O

# 4. 

# 5. 

# 6. Sharing apps

You can share your apps via two methods:

1. shinyapps.io: This is super handy for small applications: https://www.shinyapps.io/
2. shiny server: The documentation to create one is here: https://github.com/komalsrathi/shiny-server. 

Some pointers:

1. Use Grid layout for better organization
1. Use `DT::dataTableOutput`, `DT::renderDataTable` and `DT::datatable` functions for data tables (flexible and customizable)
