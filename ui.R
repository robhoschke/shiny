ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th")))),
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                box(leafletOutput("mymap", height = 300),
                    plotOutput("plotdepth")), # a leaflet output
                
                box(
                  title = "Controls", # name of the box
                  sliderInput(inputId = "slider", # a slider input
                              label = "Number of samples for leaflet map:", # text above slider
                              min = 1, # this is the minimum number to display
                              max = length(unique(metadata$Sample)), # this is the maxmimum number to display
                              value = 50, #this is the selected value
                              step = 1, # the increment (so the user can only select whole numbers)
                              round = TRUE), # this only displays round numbers on the scale
                  selectInput(
                    inputId = "species",
                    label = "Choose a species to plot",
                    choices = unique(length$scientific),
                    selected = NULL,
                    multiple = FALSE,
                    selectize = TRUE
                  ),
                  plotOutput("plotlength")
                )
              )
      ),
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
)