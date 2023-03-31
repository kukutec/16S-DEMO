library(shiny)

dashboardPage(
  dashboardHeader(title = "16S Demo"),
  dashboardSidebar(
    tags$head(
      tags$style(HTML(".skin-blue .main-header .sidebar-toggle {display: none;}"))
    ),
    sidebarMenu(id='tab',            
                menuItem("Home Page", tabName = "home", icon = icon("list")),
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
  
  
  
  
  
  dashboardBody()


