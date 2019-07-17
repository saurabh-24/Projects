next10word<-function(w){
  
  ##next word for only singal words
  w<-unlist(strsplit(w," "))
  if (length(w)==1){
    
    word1<-as.character(w)
    word1<-paste(word1," ",sep = "")
    word1<-paste("^",word1,sep = "")
    a1<-grepl(word1,bigram$Var1)
    a1<-bigram[a1,]
    a1<-a1[order(a1$Freq,decreasing = T),]
    
    a2<-a1[1:5,"Var1"]
    return(word(a2,2))
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
    return(word(a2,-1))
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
    return(word(a2,-1))
  }
  
}
