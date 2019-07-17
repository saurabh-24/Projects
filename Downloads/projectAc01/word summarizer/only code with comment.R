####### TEAM MEMBERS############

##Saurabh yadav (saurabhy506@gmail.com)
##vishakha Khandeker (vishakakhandekar@gmail.com) ( Team representative)


##Loading required libraries

library(shiny)
library(text2vec)
library(textmineR)
library(igraph)
library(data.table)
library(Matrix)

####Training the model (This part will take time to be process so they are commented and a trained data is provided on github)


#  train<- assign the article on which you want to traing your model

###Cleaning the training document

#  train<- gsub("!|@|#|$|%|^|&|*|\n","",train)

### creating Term co-occurence matrix

#  tcm <- CreateTcm(doc_vec = movie_review$review,skipgram_window = 10,verbose = FALSE,cpus = 2)

###############training the model (will take time)###############

#  embeddings <- FitLdaModel(dtm = tcm,k = 100,iterations = 400,burnin = 180,alpha = 0.1,beta = 0.05,optimize_alpha = TRUE,calc_likelihood = FALSE,calc_coherence = FALSE,calc_r2 = FALSE,cpus = 2)

#  gamma<- embedding$gamma

####function for the summarizer

summarizer2<-function(document, gamma,number_of_sentences) {

#### cleaning the article
  
  document<-gsub("!|@|#|$|%|^|&|*|\n","",document)

#### splitting the article into sentences
  
  st <- stringi::stri_split_boundaries(document, type = "sentence")[[ 1 ]]
  
#### tokenizing or assigning numbers to sentences
  names(st) <- seq_along(st) 

#### Creating Document term matrix
  
  et <- CreateDtm(st, ngram_window = c(1,1), verbose = FALSE, cpus = 2)

## taking the common colonms of our trained model which is gamma and the documents which has been converted
##into DTM
  
  vocab <- intersect(colnames(et), colnames(gamma))

## Normalizating the DTM
  
  et <- et / rowSums(et)
  
## Multiplying the DTM matrix and the trained matrix
  
  et <- et[ , vocab ] %*% t(gamma[ , vocab ])
  
  et <- as.matrix(et)
  
  et <- as.matrix(et)
  
## calculating hellinger distance which quantifies the probability of similarity between two sentences
##   
  
  dist <- CalcHellingerDist(et)
  
## For convinience
  
  mat <- (1 - dist) * 100

## assinging 0's to all the diagonal values so the sentences do not show the similarity to each other
  
  diag(mat) <- 0

####    
  mat <- apply(mat, 1, function(x){
    x[ x < sort(x, decreasing = TRUE)[ 3 ] ] <- 0
    x
  })
####  
  g <- pmax(mat, t(mat))
  
  
#### converting into graph
  
  g <- graph.adjacency(g, mode = "undirected", weighted = TRUE)
  
  
####Ranking the sentences using eigen vector centrality
  
  ev <- evcent(g)
  
  a<-number_of_sentences
  result <- st[ names(ev$vector)[ order(ev$vector, decreasing = TRUE)[ 1:a ] ] ]
  
  result <- result[ order(as.numeric(names(result))) ]
  return(paste(result, collapse = " "))
  
}