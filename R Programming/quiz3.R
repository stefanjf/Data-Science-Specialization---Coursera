library(datasets)
data(iris)
?iris
mean(iris[which(iris$Species =='virginica'),]$Sepal.Length)

rowMeans(iris[, 1:4])
apply(iris[, 1:4], 2, mean)
apply(iris, 2, mean)
colMeans(iris[,1:2])

library(datasets)
data(mtcars)

sapply(split(mtcars$mpg, mtcars$cyl), mean)
lapply(mtcars, mean)
with(mtcars, tapply(mpg, cyl, mean))
sapply(mtcars, cyl, mean)
split(mtcars, mtcars$cyl)

debug(ls)
ls
ls(pattern = "O")

