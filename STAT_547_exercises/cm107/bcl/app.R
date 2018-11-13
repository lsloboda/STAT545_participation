#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)
#str(bcl)

#the skeleton required in all Shiny apps: ui, server, run the application (this will give a blank page)

#remember the commas in the UI! everything is an argument; BUT not needed for server side, since you're defining a function

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("BC Liquor price app", 
             windowTitle = "BCL app"
  ),
  
  sidebarLayout(
    sidebarPanel("This text is in the sidebar."),
    mainPanel(
    #ggplot2::qplot(bcl$Price) -> this throws an error! needs to be in HTML format to use here; so instead we will run this on the server
      plotOutput("price_hist"), #nothing will happen here until you define the plot on the server side
      tableOutput("bcl_data")
      
      ) 
  )
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {  #cannot use ggplot directly, use render funtion
   output$price_hist <- renderPlot(ggplot2::qplot(bcl$Price))  #the $ subsets the list; the assignment operator allows us to overwrite the data 
   output$bcl_data <- renderTable(bcl)
}

# Run the application 
shinyApp(ui = ui, server = server)




# "This is some text.",
# "This is some more text.",
# tags$h1("Level 1 Header"), #using the tags list is one way to access tags, but not the only way, as shown below
# h1(em("Level 1 Header, Part 2")), #can nest tags, as shown here
# HTML("<h1>Level 1 Header, Part 3</h1>"),
# headerPanel("Yes!"),
# a(href="https://google.ca", "Link to Google!"),
# tags$b("This is bold."),
# tags$caption("This is a caption")



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