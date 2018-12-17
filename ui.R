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
  titlePanel("Correlation level Intuition Checker"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("corrrel",
                   "Correletion level - select",
                   min = 0,
                   max = 1,
                   value = 0.5),
       
       sliderInput("sample",
                   "Sample size - select",
                   min = 10,
                   max = 1000,
                   value = 100)),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot")
    )
  )
))
