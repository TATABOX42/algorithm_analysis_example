# ***********************************************
# ***********************************************
# Author: Benjamin Tovar
# Date: March 18, 2015
# Post: http://btovar.com/2015/03/algorithm-analysis-example/
# ***********************************************
# ***********************************************

# ***************************
# Load functions
# ***************************

source("function_lib.R")

# ***************************
# Load libraries
# ***************************

library(ggplot2)

# ***************************
# ***************************
# Compare the performances of
# two different algorithms (f1(n) and f2(n)).
# f1(n): quadratic algorithm | O(n^2)
# f2(n): linear algorithm | O(n)
# ***************************
# ***************************

# Run example functions to show 
# a demo of a quadratic algorithm and 
# a linear algorithm

# OBSERVE THE NUMBER OF ITERATIONS 
# EACH ALGORITHM COMPUTES

# f1(n): quadratic algorithm | O(n^2)
F1(10)

# > F1(10)
# iteration: 1 | 1 1 
# iteration: 2 | 1 2 
# iteration: 3 | 1 3 
# iteration: 4 | 1 4 
# iteration: 5 | 1 5 
# ...
# iteration: 97 | 10 7 
# iteration: 98 | 10 8 
# iteration: 99 | 10 9 
# iteration: 100 | 10 10 

# f2(n): linear algorithm | O(n)
F2(10)

# > F2(10)
# iteration: 1 | 1 
# iteration: 2 | 2 
# iteration: 3 | 3 
# iteration: 4 | 4 
# iteration: 5 | 5 
# iteration: 6 | 6 
# iteration: 7 | 7 
# iteration: 8 | 8 
# iteration: 9 | 9 
# iteration: 10 | 10

# ***************************
# Perform algorithms tests
# with different values of n
# ***************************

# ------------
# when n = 500
# ------------

n1 <- 500
plot_number_operations(n1)

# ------------
# when n = 1000
# ------------

n2 <- 1000
plot_number_operations(n2)

# ------------
# when n = 10000
# ------------

n3 <- 10000
plot_number_operations(n3)

# export plots
file_title <- paste("figure_operations_n_",n1,".pdf",sep="")
pdf(file_title,width=6,height=6)
  plot_number_operations(n1)
dev.off()

file_title <- paste("figure_operations_n_",n2,".pdf",sep="")
pdf(file_title,width=6,height=6)
  plot_number_operations(n2)
dev.off()


file_title <- paste("figure_operations_n_",n3,".pdf",sep="")
pdf(file_title,width=6,height=6)
  plot_number_operations(n3)
dev.off()

# ***************************
# Compare algorithm performance:
# Supercomputer will be using the f1(n) algorithm
# Home computer will be using the f2(n) algorithm
# ***************************

# set computations/second for each computer
super_computer_operations_second <-1e10
home_computer_operations_second <-1e6

# how much times the supercomputer is faster than the 
# home computer?

d <- super_computer_operations_second/home_computer_operations_second
cat("The supercomputer is: ",d," times faster than the home computer!\n")
# The Supercomputer is:  10000  times faster than the home computer!

# Set the problem to test, say:
# We need to run our algorithm for a very 
# large problem of 
# 10^10 

x <- 1e10

# **********************
# Results: Supercomputer
# **********************

# 2e10 seconds == 5,555,560 hours == 633.776 years
f1_seconds <- f1_super_computer(x,FALSE) 
f1_hours <- f1_super_computer(x) 
f1_years <- f1_seconds * 3.16888e-8

# **********************
# Results: Home computer
# **********************

# 46,051,702 seconds == 12,793 hours == 1.459323 years
f2_seconds <- f2_home_computer(x,FALSE)
f2_hours <- f2_home_computer(x) 
f2_years <- f2_seconds * 3.16888e-8

# **********************
# Print plots
# **********************

n4 <- 1e7
n5 <- 1e8
n6 <- 1e10

# problem size = 1e7
# plot in hours
plot_time(n4,FALSE)
# problem size = 1e8
# plot in hours
plot_time(n5,FALSE)
# problem size = 1e10
# plot in years
plot_time(n6)

# export plots
file_title <- paste("figure_time_n_",n4,".pdf",sep="")
pdf(file_title,width=6,height=6)
  plot_time(n4,FALSE)
dev.off()

file_title <- paste("figure_time_n_",n5,".pdf",sep="")
pdf(file_title,width=6,height=6)
  plot_time(n5,FALSE)
dev.off()

file_title <- paste("figure_time_n_",n6,".pdf",sep="")
pdf(file_title,width=6,height=6)
  plot_time(n6)
dev.off()




