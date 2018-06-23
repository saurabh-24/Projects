## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    y<<-x
    inverse_matrix<<-solve(x)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        if(identical(x,y)){
          print("caching")
          return(inverse_mat)
        }else{
          print("calculating the inverse matrix")
          inverse_mat<<-solve(x)
          return(inverse_mat)
        }
}
