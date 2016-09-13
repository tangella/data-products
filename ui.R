#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
        # Application title
        titlePanel("AAPL chart"),
        
        # Sidebar with a slider input for number of months 
        sidebarLayout(
                sidebarPanel(
                        sliderInput("bins",
                                    "Select the time line for chart data for AAPL",
                                    min = 1,
                                    max = 12,
                                    value = 3)
                ),
                
                # Show a plot of the generated graph
                mainPanel(
                        plotOutput("distPlot")
                )
        )
))
