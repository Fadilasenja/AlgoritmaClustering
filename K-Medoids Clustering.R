install.packages("tidyverse")
install.packages("cluster")
install.packages("factoextra")
library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering algorithms & visualization

#input data
data=read.csv(file.choose(),header=TRUE)
data

summary(is.na(data[,2:12])) #melihat missing value
summary(data[,2:12]) #melihat deskriptif data
boxplot(data[,2:12]) #melihat data outlie


### uji multikolinearitas ###
library(car)
multikolinearitas<-cor(data[,2:12])
multikolinearitas
view(multikolinearitas)

library(PerformanceAnalytics)
chart.Correlation(data[,2:12])

### penentuan jumlah cluster ###
# silhouette
fviz_nbclust(data[,2:12], pam, method = "silhouette")

#elbow
fviz_nbclust(data[,2:12], pam, method = "wss")

### K-Medoids cluster ###
library(cluster)
pam.result <- pam(data[,2:12],2)
print(pam.result)

## jarak
pam.result$diss

### dataframe hasil cluster ###
df.cluster = data.frame(data,pam.result$cluster)
View(df.cluster)

## Clustering
#sesuai abjad
table(pam.result$clustering, data$Provinsi)

## plot cluster
fviz_cluster(pam.result, data = data[,2:12])

### rata-rata cluster ###
data[,2:12] %>%
  mutate(Cluster = pam.result$cluster) %>%
  group_by(Cluster) %>%
  summarise_all("mean")

