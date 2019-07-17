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
      return(a5)
    }
  }
  
  
  
  if(length(w)==2){
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
      return("Please type a valid word")
    }
    else{
      for (a in a5) {
        print(a)
      }
    }
  }
  
  if(length(w)>=3){
    w<-paste(w,collapse = " ")
    word1<-word(w,-3:-1)
    word1<-paste(word1,collapse = " ")
    word1<-paste(word1," ",sep = "")
    word1<-paste("^",word1,sep = "")    
    a1<-grepl(word1,quadgram$Var1)
    a1<-quadgram[a1,]
    a1<-a1[order(a1$Freq,decreasing = T),]
    a2<-a1[1:5,"Var1"]
    a3<-word(a2$Var1,-1)
  ##remove na and " "
    a4<-a3%in%na
    a5<-a3[!a4]
    
  
    if(length(a5)==0){
    ##using both bigram and trigram
      #############################
      word1<-word(w,-2:-1)
      word1<-paste(word1,collapse = " ")
      word1<-paste(word1," ",sep = "")
      word1<-paste("^",word1,sep = "")    
      a1<-grepl(word1,trigram$Var1)
      a1<-trigram[a1,]
      a1<-a1[order(a1$Freq,decreasing = T),]
      a2<-a1[1:5,"Var1"]
      a3<-word(a2$Var1,-1)
      a4<-a3%in%na
      a5<-a3[!a4]
      
      if(length(a5)==0){
        return("please type a valid word")
        
      }
      else{
        return(a5)
      }
      
      
      
      
    #################################  
    }
    else{
      return(a5)
    }
  }
}