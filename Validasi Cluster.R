#input data
data=read.csv(file.choose(),header=TRUE)
data

library(clValid)
library(kohonen)
BSDataIntern <-data[,c("X1","X8","X10","X11","X12","X13","X14","X15","X16","X17","X18")]
row.names(BSDataIntern) <- data$Provinsi
BSInternal<- clValid(BSDataIntern, 2:12, clMethods=c("pam","som"),validation="internal")
summary(BSInternal)