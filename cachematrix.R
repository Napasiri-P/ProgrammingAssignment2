## create a cache matrix storing an inverse of the matrix

## retrun a list of functions to set, get, setinvert,
## and getinvert of the input matrix

makeCacheMatrix <- function(x = matrix()) {
  inv_matrix <- NULL
  set <- function(y){
    x <<- y
    inv_matrix <- NULL
  }
  get <- function() x
  setinvert <- function(inverted) inv_matrix <<- inverted
  getinvert <- function() inv_matrix
  list(set = set, get = get,
       setinvert = setinvert,
       getinvert = getinvert)
}

fi
## checks if the inverseis already stored in cache matrix,
## if not, then it setinvert
## in the cache matrix and retrun the inverse matrix of input

cacheSolve <- function(x, ...) {
  inv_matrix <- x$getinvert()
  if(!is.null(inv_matrix)){
    message("getting cached data")
    return(inv_matrix)
  }
  input_matrix <- x$get()
  inv_matrix <- solve(input_matrix)
  x$setinvert(inv_matrix)
  inv_matrix
}
