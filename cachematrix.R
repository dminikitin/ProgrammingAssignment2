## Note: names of the methods changed to follow guidlines suggested here:
## https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml#identifiers

## factory function to create a matrix that can cache the value of its inverse
MakeCacheMatrix <- function(x = matrix()) {
  # initialize the cached value of matrix inverse to be NULL
  inverse.cache <- NULL
  
  # create setter function to...
  Set <- function(y) {
    # ...store the matrix
    x <<- y
    # ...and reset the cached inverse value
    inverse.cache <<- NULL
  }
  
  # create getter function - return incapsulated matrix
  Get <- function() x
  
  SetInverse <- function(inverse) inverse.cache <<- inverse
  
  GetInverse <- function() inverse.cache
  
  list(Set = Set, Get = Get,
       SetInverse = SetInverse,
       GetInverse = GetInverse)
}


## Calculate the inverse of the matrix; get the cached inverse matrix if it exists 
CacheSolve <- function(x, ...) {
  # get cached inverse
  inverse <- x$GetInverse()
  # ...return cached inverse if it exists
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  # otherwise get the matrix
  data <- x$Get()
  # ...calculate inverse
  inverse <- solve(data, ...)
  # ...and cache it
  x$SetInverse(inverse)
  # return calculated inverse matrix object
  inverse
}
