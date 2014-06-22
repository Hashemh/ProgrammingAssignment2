# This R script is a pair of functions that cache the inverse of a matrix.

 ## In the first function below, it creates a special "matrix" object
 ## that can cache its inverse.
  ###  It creates a list containing a function to:
  ### 1. set the value of the matrix
  ### 2. get the value of the matrix
  ### 3. set the value of inverse of the matrix
  ### 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  invers <- NULL
  set <- function(y) {
    x <<- y
    invers <<- NULL
  }
  get <- function() x
  setinverse <- function(inversed) invers <<- inversed
  getinverse <- function() invers
  
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}




## In the second function, it computes the inverse of the special
## matrix returned by the function above. If the inverse has
## already been calculated (and the matrix has not changed), then
## the function will retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  invers <- x$getinverse()
  if(!is.null(invers)) {
    message("getting cached data.")
    return(invers)
  }
  data <- x$get()
  invers <- solve(data) ## Return a matrix that is the inverse of 'x'
  x$setinverse(invers)
  invers

}
