library(caTools)
library(caret)
library(class)
data(iris)
head(iris)

str(iris)

summary(iris)

table(iris$Species)


split=sample.split(iris$Species,SplitRatio=0.7)

train=subset(iris,split==TRUE)
test=subset(iris,split==FALSE)

table(train$Species)
table(test$Species)

train_scale=scale(train[,1:4])
test_scale=scale(test[,1:4])

model=knn(train=train_scale,test=test_scale,cl=train$Species,k=3)

cm=table(model,test$Species)

confusionMatrix(cm)
