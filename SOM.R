#mengaktifkan package kohonen
library(kohonen)

#input data
data2017=read.csv(file.choose(),header=TRUE)
data2017
data<- data2017[,-1]


#scaling data
data
scale(data)
dim(data)
str(data)

#algoritma SOM
set.seed(500)
grid <- somgrid(xdim=5, ydim=5, topo="hexagonal")
som.data<- som(scale(data), grid=somgrid(xdim=5, ydim=5,
                                         topo="hexagonal"))
str(som.data)
plot(som.data, type="mapping")
som.data$grid$pts
som.data$unit.classif
plot(som.data)
som.data$codes[[1]]
dist(som.data$codes[[1]])

#hclust to 2 cluster
hclust(dist(som.data$codes[[1]]))
peta<-cutree(hclust(dist(som.data$codes[[1]])),2)

#menampilkan plot
plot(peta)
plot(som.data,type="codes",bgcol=rainbow(5)[peta])
add.cluster.boundaries(som.data,peta)
kelompok <- data.frame(id=data2017$Provinsi,
                       cluster=peta[som.data$unit.classif])
kelompok
View(kelompok)
