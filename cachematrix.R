
## The two functions are used to create a special object that stores
## a matrix and its inverse

## The first function makeCacheMatrix creats a special "matrix",
## which is a list containning a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the matrix inverse
## get the value of the matrix inverse

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL
        set <- function(y) {
          x <<- y
          m <<- NULL
        }
        get <- function () x
        setinverse <- function(solve) inverse <<- i
        getinverse <- function () i
        list( set= set, get = get, setinverse= setinverse, getinverse= getinverse)
}

## The second function calculates the mean of the special matrix created with
## the above function. It first checks to see if the inverse has already been
## calculated.
## If so, it gets the inverse from the cache and skips the computation
## Otherwise, it calculates the inverse and sets the value in the cache via the setmean function.

cacheSolve <- function(x, ...) {
          inverse <- x$getinverse()
          if (!is.null(inverse)){
            message("getting cached data")
            return (inverse)
          }
          data <- x$get()
          inverse <- solve(data,...)
          x$setinverse(inverse)
          inverse
}
