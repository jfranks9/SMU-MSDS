#Swirl 8
TRUE == TRUE
(FALSE==TRUE)==FALSE
6==7
6<7
10<=10
4 9 >= 10
4 -6 > -7
5 != 7
!5==7
1 !(0 >= -1)
1 TRUE
FALSE&FALSE
TRUE & c(TRUE,FALSE,FALSE)
TRUE && c(TRUE,FALSE,FALSE)
TRUE | c(TRUE,FALSE,FALSE)
5 > 8 || 6 != 8 && 4 > 3.9
1 TRUE && FALSE || 9 >= 4 && 3 < 6
1 FALSE && 6 >= 6 || 7 >= 8 || 50 <= 49.5
isTRUE(6>4)
3 !isTRUE(4 < 3)
identical('twins', 'twins')
2 identical(5 > 4, 3 < 3.1)
4 xor(4 >= 9, 8 != 8.0)
ints <- sample(10)
ints
ints > 5
which(ints>7)
1 which(ints <= 2)
any(ints<0)
all(ints>0)
4 any(ints == 10)

#Swirl 9
Sys.Date()
mean(c(2,4,5))
boring_function <- function(x) {
  x
}
submit()
boring_function('My first function!')
boring_function
my_mean <- function(x) {
  sum(x)/length(x)
  
}
submit()
remainder <- function(num, divisor=2) {
  
  num %% divisor
}
submit()
remainder(5)
remainder(11,5)
remainder(divisor = 11, num = 5)
remainder(4, div = 2)
args(remainder)
evaluate <- function(func, dat){
  func(dat) 
}
submit()
evaluate(sd,c(1.4,3.6,7.9,8.8))
evaluate(function(x){x+1}, 6)
evaluate(function(x){x[1]}, c(8,4,0))
evaluate(function(x){x[length(x)]}, c(8,4,0))
paste("Programming", "is", "fun!")
telegram <- function(...){
  paste("START", ... , "STOP")
}
submit()
telegram("hey", "morse")
mad_libs <- function(...){
  # Do your argument unpacking here!
  
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}
submit()
mad_libs("school", "red", "dog")
"%p%" <- function(left, right){ # Remember to add arguments!
  
  paste(left, right)
}
submit()
'I' %p% 'love' %p% 'R!'




#Swirl 10
head(flags)
dim(flags)
class(flags)
cls_list <- lapply(flags, class)
cls_list
as.character(cls_list)
cls_vect <- sapply(flags, class)
class(cls_vect)
sum(flags$orange)
flag_colors <- flags[, 11:17]
head(flag_colors)
lapply(flag_colors, sum)
sapply(flag_colors, sum)
sapply(flag_colors, mean)
flag_shapes <- flags[, 19:23]
lapply(flag_shapes, range)
shape_mat <- sapply(flag_shapes, range)
shape_mat
class(shape_mat)
unique(c(3, 4, 5, 5, 5, 6, 6))
unique_vals <- lapply(flags, unique)
unique_vals
sapply(unique_vals,length)
sapply(flags,unique)
lapply(unique_vals, function(elem) elem[2])


#Swirl 11
sapply(flags, unique)
vapply(flags, unique, numeric(1))
ok()
sapply(flags, class)
vapply(flags, class, character(1))
?tapply
table(flags$landmass)
table(flags$animate)
tapply(flags$animate,flags$landmass, mean)
tapply(flags$population, flags$red, summary)
6 3.0
tapply(flags$population, flags$landmass, summary)
5 56.00




