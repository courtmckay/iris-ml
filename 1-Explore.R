#1-Explore.R


#------- Summarize Dataset

#dimensions of dataset
dim(dataset) #120 rows, 5 columns

#list data types
sapply(dataset, class)

#view data
head(dataset)

#list levels for the factor data
levels(dataset$Species) #there are three levels corresponding
#to three species of iris

#summarize the class distribution
percentage <- prop.table(table(dataset$Species)) * 100
cbind(freq=table(dataset$Species), percentage=percentage)

#Summarize attribute distributions
summary(dataset)


#------- Visualize dataset


#it's useful to be able to look at input attributes seperately from
#the output

x <- dataset[,1:4]
y <- dataset[,5]

#boxplot for each of the measurements
par(mfrow =c(1,4))
  for(i in 1:4) {
    boxplot(x[,i], main= names(iris)[i])
  }

#barplot for class breakdown
plot(y)


#------- Multivariate plots


#scatterplot matrix
featurePlot(x=x, y=y, plot = "ellipse")

#box and whisker plots for each attribute
featurePlot(x=x, y=y, plot="box")

#density plots for each attribute by class value
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)
