library(shiny)
library(rCharts)

shinyUI(
navbarPage("The great inventions and scientific discoveries Explorer",
tabPanel("Plot",
sidebarPanel(
sliderInput("range",
"Year Range:",
min = 1860,
max = 1959,
value = 1900,
format="####"),
uiOutput("evtypeControls")
),

mainPanel(
tabsetPanel(
# Time series data
tabPanel('By Year',
h4('The great inventions and scientific discoveries', align = "center"),
plotOutput("discov"),
h4('Year', align = "left"),
verbatimTextOutput("yr"),
h4('Number of Important Discoveries', align = "left"),
verbatimTextOutput("ranges")
)
)
)
),
tabPanel("About",
mainPanel(
includeMarkdown("about.md")
)
)
,
tabPanel("Documentation",
         mainPanel(
           includeMarkdown("documentation.md")         )
)
)
)