#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

#the skeleton required in all Shiny apps: ui, server, run the application (this will give a blank page)

# Define UI for application that draws a histogram
ui <- fluidPage(
   "This is some text.",
   "This is some more text.",
    tags$h1("Level 1 Header"), #using the tags list is one way to access tags, but not the only way, as shown below
    h1(em("Level 1 Header, Part 2")), #can nest tags, as shown here
    HTML("<h1>Level 1 Header, Part 3</h1>"),
    headerPanel("Yes!"),
    a(href="https://google.ca", "Link to Google!"),
    tags$b("This is bold."),
    tags$caption("This is a caption")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   

}

# Run the application 
shinyApp(ui = ui, server = server)










# # Application title
# titlePanel("Old Faithful Geyser Data"),
# 
# # Sidebar with a slider input for number of bins 
# sidebarLayout(
#   sidebarPanel(
#     sliderInput("bins",
#                 "Number of bins:",
#                 min = 1,
#                 max = 50,
#                 value = 30)
#   ),
#   
#   # Show a plot of the generated distribution
#   mainPanel(
#     plotOutput("distPlot")
#   )
# )
# output$distPlot <- renderPlot({
#   # generate bins based on input$bins from ui.R
#   x    <- faithful[, 2] 
#   bins <- seq(min(x), max(x), length.out = input$bins + 1)
#   
#   # draw the histogram with the specified number of bins
#   hist(x, breaks = bins, col = 'darkgray', border = 'white')
# })