#0-Load.R
  #Part of project to follow "Your First Machine Learning Project in R Step-By-Step"
  #https://machinelearningmastery.com/machine-learning-in-r-step-by-step/



#------- Set up environment

#install.packages("caret") #caret package provides a consistent interface into hundreds of
#machine learning algorithms and provides useful methods for data visualization, data
#resampling, model tuning and model comparison.
#install.packages("ellipse")
#install.packages("e1071")
library(caret)
library(ellipse)
library(e1071)

#------- Load data

#we'll be using the iris data for this tutorial. The dataset contains 150 obsesrvations of
#iris flowers collected in the 1930s on the Gaspe Peninsula. The original researchers used
#linear discriminant analysis to categorize the species of iris based on four measurements
#or features: the length and width of both the sepals and petals

data("iris") #load data
dataset <- iris #rename


#------- Create validation dataset

#create a list of 80% of the rows in the original dataset to be used for training
validation_index <- createDataPartition(dataset$Species, p=0.8, list=FALSE)
#select 20% of the data for validation
validation <- dataset[-validation_index,]
#use the remaining 80% of data to training the model
dataset <- dataset[validation_index,]