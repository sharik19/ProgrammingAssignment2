## This file provides two functions to cache the inverse of a matrix

## I have written this function to make a list vector so that a function can set the value of the matrix, get its value, set its inverse value or get its inverse value
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) i <<- solve
  getsolve <- function() i
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
## The function below caches the inversed matrix and in the absence of such a matrix calculates the inverse

cacheSolve <- function(x, ...) {
  i <- x$getsolve()
  if(!is.null(i)) {
    message("getting inversed matrix")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setsolve(i)
  i
}
