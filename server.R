#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library('MASS')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
  
  output$plot <- renderPlot({
    
    data <- mvrnorm(n=input$sample, mu=c(0, 0), Sigma=matrix(c(1, input$corrrel, input$corrrel, 1), nrow=2), empirical=TRUE)
    data <- as.data.frame(data)
    names(data) <- c("variable1","variable2")
    
    # draw the histogram with the specified number of bins
    ggplot(data, aes(variable1,variable2)  ) +
      geom_point() + 
      stat_smooth(method=lm, se = F)
    
  })
  
})
