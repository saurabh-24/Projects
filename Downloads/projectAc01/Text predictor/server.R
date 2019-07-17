#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(readr)
library(data.table)
library(stringr)
bigram<-fread("bigram.csv")
trigram<-fread("trigram.csv")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {


  options(shiny.sanitize.errors = FALSE)
  
  next10word<-function(w){
    na<-c(NA,""," ")
    ##next word for only singal words
    w<-tolower(w)
    w<-unlist(strsplit(w," "))
    if (length(w)==1){
      
      word1<-as.character(w)
      word1<-paste(word1," ",sep = "")
      word1<-paste("^",word1,sep = "")
      a1<-grepl(word1,bigram$Var1)
      a1<-bigram[a1,]
      a1<-a1[order(a1$Freq,decreasing = T),]
      
      a2<-a1[1:5,"Var1"]
      a3<-word(a2$Var1,-1)
      ##remove na and " "
      a4<-a3%in%na
      a5<-a3[!a4]
  
      if(length(a5)==0){
        return("please type a valid word")
      }
      else{
        return(paste(a5," "))
      }
    }
    
    
    
    if(length(w)>=2){
      w<-paste(w,collapse = " ")
      word1<-word(w,-2:-1)
      word1<-paste(word1,collapse = " ")
      word1<-paste(word1," ",sep = "")
      word1<-paste("^",word1,sep = "")    
      a1<-grepl(word1,trigram$Var1)
      a1<-trigram[a1,]
      a1<-a1[order(a1$Freq,decreasing = T),]
      a2<-a1[1:5,"Var1"]
      a3<-word(a2$Var1,-1)
      ##remove na and " "
      a4<-a3%in%na
      a5<-a3[!a4]
      
        if(length(a5)==0){
          ##using both bigram and trigram
          #############################
          word1<-word(w,-1)
          word1<-paste(word1,collapse = " ")
          word1<-paste(word1," ",sep = "")
          word1<-paste("^",word1,sep = "")    
          a1<-grepl(word1,bigram$Var1)
          a1<-bigram[a1,]
          a1<-a1[order(a1$Freq,decreasing = T),]
          a2<-a1[1:5,"Var1"]
          a3<-word(a2$Var1,-1)
          a4<-a3%in%na
          a5<-a3[!a4]
          a6<-paste(a5,"  ")
          if(length(a5)==0){
            
            return("please type a valid word")
            
          }
          else{
            return(a5)
          }
      }
      else{
        return(a5)
      }
    }
    
    
    
    
    
    
    
  }
  
    nextword1<-reactive({
      w<-as.character(input$text)
      a<-next10word(w)
      paste(a,"  , ")
    })
    
    output$nextword<-renderText(nextword1())
    output$enterword<-renderText(input$text)
})
