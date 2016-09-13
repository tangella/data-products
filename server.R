#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(quantmod)

# Download data for a stock if needed, and return the data
require_symbol <- function(symbol, envir = parent.frame()) {
        if (is.null(envir[[symbol]])) {
                envir[[symbol]] <- getSymbols(symbol, auto.assign = FALSE)
        }
        
        envir[[symbol]]
}

# Define server logic required to draw a chart for AAPL
shinyServer(function(input, output) {
        # Create an environment for storing data
        symbol_env <- new.env()
        
        # Make a chart for a symbol, with the settings from the inputs
        make_chart <- function(symbol) {
                symbol_data <- require_symbol(symbol, symbol_env)
                
                chartSeries(symbol_data,
                            subset = paste('last ' , input$bins, ' months', sep = ''))
                
        }
        
        output$distPlot <- renderPlot({ make_chart("AAPL") })
})
