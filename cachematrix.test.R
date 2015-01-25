source('cachematrix.R')

# create square invertable marix
m=rbind(c(1, -1/4), c(-1/4, 1))

# create cached matrix
cache.m <- MakeCacheMatrix(c)

# caclulate inverse
inv <- CacheSolve(cc)

#print result
inv

# check the result of multiplication of inverse by original - expect identity matri
inv %*% m