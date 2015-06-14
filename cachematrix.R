## The first function creates a special "matrix" object that can cache its inverse.
## The idea is to create an inverse of a matrix which can  potentially 
## be time-consuming in computations, and instead cache it into memory, so that 
## if there is no change to the inversed matrix, it will be cached without
## having to re-create the inverse matrix all over again.

## This function will receive a matrix object and cache the matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x  ##receive the matrix to be cached
    setmatrix <- function(matrix) m <<- matrix  ##set the value of the matrix
    getmatrix <- function() m  ##get the value of the matrix
    list(set = set, get = get,
         setmatrix = setmatrix,
         getmatrix = getmatrix)
}

## This function will receive a matrix created by the above function 
## and return the inverse of it.

cacheSolve <- function(x, ...) {
    m <- x$getmatrix()  ##
  if(!is.null(m)) {  ##if no change, return the matrix in cache 
    message("getting cached data")
    return(m)
  } else {
    solve(x) ## Return a matrix that is the inverse of 'x'
    }
}