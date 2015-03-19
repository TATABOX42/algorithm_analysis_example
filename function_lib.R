# ***********************************************
# ***********************************************
# Author: Benjamin Tovar
# Date: March 18, 2015
# Post: http://btovar.com/2015/03/algorithm-analysis-example/
# ***********************************************
# ***********************************************

# *****************
# define functions:
# *****************

F1 <- function(x) {
  # *****************
  # example of a quadratic function
  # Complexity: O(n^2)
  # *****************
  # set counter
  counter <- 1
  for (i in 1:x) { # first n
    for (j in 1:x) { # second n
      cat("iteration:",counter,"| output: ",i,j,"\n") # n*n = n^2 
      counter <- counter + 1
    }
  }
}

F2 <- function(x) {
  # *****************
  # example of a quadratic function
  # Complexity: O(n)
  # *****************
  # set counter
  counter <- 1
  for (i in 1:x) { # first and only n
    cat("iteration:",counter,"| output: ",i,"\n")  
    counter <- counter + 1
  }
}

f1 <- function(n){
  # quadratic function
  # Complexity: O(n^2)
  r <- 2*(n^2)
  return(r)
}

f2 <- function(n) {
  # linear function
  # Complexity: O(n)
  r <- 200*n*(log(n))
}

f1_super_computer <- function(n,convert2hours=TRUE) {
  # if  convert2hours == FALSE, return seconds.
  # set operations per second
  y <- f1(n)
  # calculate computing time
  r <- y/1e10
  # set to hours
  ifelse(convert2hours, r <- ceiling(r * 0.000277778), r <- ceiling(r))
  return(r)
}



f2_home_computer <- function(n,convert2hours=TRUE) {
  # if  convert2hours == FALSE, return seconds.
  # set operations per second
  y <- f2(n)
  # calculate computing time
  r <- y/1e6
  # set to hours
  ifelse(convert2hours, r <- ceiling(r * 0.000277778), r <- ceiling(r))
  return(r)
}

plot_time <- function(n,convert2years=TRUE) {
  # set max value of n
  N <- n
  # set vector (taking steps by 10% by 10%)
  n <- seq(from=0,to=n,by=ceiling(n*0.10));n[1] <- 1
  # compute length of vector n
  l <- length(n)
  # compute values using f1(n) 
  y1 <- sapply(n,f1_super_computer)
  # compute values using f2(n) 
  y2 <- sapply(n,f2_home_computer)
  # adjust to years
  if(convert2years){
    y1 <- y1 * 0.00011408
    y2 <- y2 * 0.00011408
    ylabel <- "Years"
  }else{
    ylabel <- "Hours"
  }
  # create a data frame to store results
  dat <- data.frame(n=n,
                    fx=c(rep("f1(n)",l),
                        rep("f2(n)",l)),
                    y=c(y1,y2))
  # ****************
  # plot the results
  # ****************  
  # plot the results
  plot_title <- paste("Supercomputer using f1(n) VS home computer using f2(n)\nfor i in 1 to ",N,sep="")
  ggplot(dat,aes(x=n,y=y)) + 
    geom_line(aes(colour=fx)) + 
    labs(title=plot_title,
         y=ylabel) + 
    theme_minimal() 
}

plot_number_operations <- function(n,exportPlot=FALSE) {
  # set max value of n
  N <- n
  # set vector (taking steps by 10% by 10%)
  n <- seq(from=0,to=n,by=ceiling(n*0.10));n[1] <- 1
  # compute length of vector n
  l <- length(n)
  # compute values using f1(n) 
  y1 <- sapply(n,f1)
  # compute values using f2(n) 
  y2 <- sapply(n,f2)
  # create a data frame to store results
  dat <- data.frame(n=n,
                    fx=c(rep("f1(n)",l),
                        rep("f2(n)",l)),
                    y=c(y1,y2))
  # ****************
  # plot the results
  # ****************
  # set plot title
  plot_title <- paste("Function f1(n) vs function f2(n)\nfor i in 1 to ",N,sep="")
  ggplot(dat,aes(x=n,y=y)) + 
    geom_line(aes(colour=fx)) + 
    labs(title=plot_title,
         y="Number of operations") + 
    theme_minimal()
}

