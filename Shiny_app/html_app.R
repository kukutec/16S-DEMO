library(shiny)

ui <- fluidPage(
  fileInput("html_file", "Upload HTML file"),
  htmlOutput("html_output")
)

server <- function(input, output) {
  output$html_output <- renderUI({
    req(input$html_file)
    HTML(readLines(input$html_file$datapath))
  })
}

shinyApp(ui, server)