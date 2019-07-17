nextword<-function(w){

  ##next word for only singal words
  w<-unlist(strsplit(w," "))
  if (length(w)==1){
    
    word0<-as.character(w)
    word1<-paste(word0," ",sep = "")
    word2<-paste("^",word1,sep = "")
    a1<-grepl(word2,bigram$Var1)
    a2<-bigram[a1,]
    a3<-a2[order(a2$Freq,decreasing = T),]
    
    a4<-a3[1,"Var1"]
    return(word(a4,2))
  }
  
  
  if(length(w)>2){
    w<-paste(w,collapse = " ")
    word0<-word(w,-2:-1)
    word1<-paste(word0,collapse = " ")
    word2<-paste(word1," ",sep = "")
    word3<-paste("^",word2,sep = "")    
    a5<-grepl(word3,trigram$Var1)
    a6<-trigram[a5,]
    a7<-a6[order(a6$Freq,decreasing = T),]
    a8<-a7[1,"Var1"]
    return(word(a8,3))
    
    
  }
}









next10word<-function(w){
  
  ##next word for only singal words
  w<-unlist(strsplit(w," "))
  w1<-w
  if (length(w)==1){
    
    word0<-as.character(w)
    word1<-paste(word0," ",sep = "")
    word2<-paste("^",word1,sep = "")
    a1<-grepl(word2,bigram$Var1)
    a2<-bigram[a1,]
    a3<-a2[order(a2$Freq,decreasing = T),]
    
    a4<-a3[1:10,"Var1"]
    return(word(a4,2))
  }
  
  
  if(length(w)==2){
    w<-paste(w,collapse = " ")
    word0<-word(w,-2:-1)
    word1<-paste(word0,collapse = " ")
    word2<-paste(word1," ",sep = "")
    word3<-paste("^",word2,sep = "")    
    a5<-grepl(word3,trigram$Var1)
    a6<-trigram[a5,]
    a7<-a6[order(a6$Freq,decreasing = T),]
    a8<-a7[1:10,"Var1"]
    return(word(a8,-1))
  }
  
  
  if(length(w)>=3){
    w<-paste(w,collapse = " ")
    word0<-word(w,-3:-1)
    word1<-paste(word0,collapse = " ")
    word2<-paste(word1," ",sep = "")
    word3<-paste("^",word2,sep = "")    
    a5<-grepl(word3,quadgram$Var1)
    a6<-quadgram[a5,]
    a7<-a6[order(a6$Freq,decreasing = T),]
    a8<-a7[1,"Var1"]
    return(word(a8,-1))
  }
  
}
