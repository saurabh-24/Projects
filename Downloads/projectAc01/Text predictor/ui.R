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
  sidebarPanel(h4("Please wait only for the FIRST prediction because it may take time because of data loading")),


  # Sidebar with a slider input for number of bins 
  fluidRow(
    column(4,""),
    column(6,mainPanel(img(src="download.png")))
    
    ),

  
  br(),
  br(),
  br(),
  br(),
  
  
  fluidRow(
    column(5,""),
    column(6,
  mainPanel(
      h4(textInput("text",h1("Enter your word"),value = ""))
    ))),
  br(),
    # Show a plot of the generated distribution
  fluidRow(
    column(5,""),
    column(7,
    mainPanel(
      h3("The next five predicted words are:"),
      h3(textOutput("nextword")
      )
      ))),
  
  br(),
  br(),
  br(),
  br(),

  fluidRow(
    column(5,""),
    column(7,
           mainPanel(
             h3("The entered words are:"),
             h2(textOutput("enterword")
             )
           )))
  
  ))
