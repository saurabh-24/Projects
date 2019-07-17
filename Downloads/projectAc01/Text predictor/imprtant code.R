for(i in 1:length(strspl)){

  
  d<-strspl[[i]]


  for (j in d) {
    count=count+1
    allword[count]<-j
  
  }
}

for (i in 1:length(strspl)) {
  
  d1<-strspl[[i]]
  d2<-ngrams(d1,2)
  d3<-vapply(d2, paste, "" ,collapse=" ")
  
  for (j in d3) {
    count=count+1
    allwords[count]<-j
  }
  
}