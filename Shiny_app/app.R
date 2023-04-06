#global
library(shiny)
library(shinydashboard)

#UI
ui <- dashboardPage(
    dashboardHeader(title = "16S Demo"),
    dashboardSidebar(
        tags$head(
        tags$style(HTML(".skin-blue .main-header .sidebar-toggle {display: none;}"))
        ),
        sidebarMenu(id='tab',            
            menuItem("Overview", tabName = "overview", icon = icon("list")),
            menuItem("MultiQC", tabName = "qc", icon = icon("list")),
            menuItem("Taxonomic Profile", tabName = "taxonomic", icon = icon("list")),
            menuItem("About", tabName = "about", icon = icon("list")),
            menuItem("scRNAseq Analyzer", tabName = "input", icon = icon("edit")),
            conditionalPanel(condition = "input.tab == 'input'",
                div(
                    fileInput("file", "Upload File", multiple=TRUE, accept=c('.rds')),
                    actionButton("reset", "Reset", icon = icon("undo"), style = "color: #fff; background-color: #dc3545; width: 87.25%"),
                    actionButton("run", "Run", icon = icon("play"), style = "color: #fff; background-color: #28a745; width: 87.25%")
                    )
                )
        )
    ), 




    
    dashboardBody(
        tabItems(
            tabItem(tabName = "overview",
                    fluidRow(
                        box(
                            title = "Overview",
                            solidHeader = TRUE,
                            width = 12,
                            status = "primary",
                            collapsible = TRUE,
                            collapsed = FALSE,
                            footer = NULL,
                            plotOutput("overview", height = "400px")
                        )
                    )
            ),
            tabItem(tabName = "qc",
                    fluidPage(
                      fileInput("html_file", "Upload HTML file"),
                      htmlOutput("html_output")
                        )
                    )
            ),
            tabItem(tabName = "about",
                    fluidRow(
                        box(
                            title = "About",
                            solidHeader = TRUE,
                            width = 12,
                            status = "primary",
                            collapsible = TRUE,
                            collapsed = FALSE,
                            footer = NULL,
                            plotOutput("about", height = "400px")
                        )
                    )
            ),
            tabItem(tabName = "input",
                    fluidRow(
                        box(
                            title = "scRNAseq Analyzer",
                            solidHeader = TRUE,
                            width = 12,
                            status = "primary",
                            collapsible = TRUE,
                            collapsed = FALSE,
                            footer = NULL,
                            plotOutput("input", height = "400px")
                        )
                    )
            )
        )
    )
)         
        


#server
server <- function(input, output, session){

    

}



shinyApp(ui, server)
