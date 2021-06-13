
# Architecture

Separate `ui.R` and `server.R`:

```
architecture
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
architecture
├── app.R # combines ui and server in one script
└── ... # same as above
```

# Layouts