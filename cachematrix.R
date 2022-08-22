## the below functions create a special object to store a matrix and
## cache its vector

## following function creates list containing function to get the malue of matrix,
## set the value of matrix, set the value of inverse and get the value of inverse 

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inverse <<- solve
  getinverse <- function() inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## following function checks to see if inverse has already been calculated. If calculated,
## it gets the inverse from cache else it calculates inverse using solve and sets the value 
## in cache using setinverse function

cacheSolve <- function(x, ...) {
  inverse <- x$getinverse
  if (!is.na(inverse)) {
    message("getting cached inverse")
    return(inverse)
  }
  matrix <- x$get()
  inverse <- solve(matrix)
  x$setinverse(inverse)
  inverse
}
