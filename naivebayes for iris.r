
library(caTools)
library(caret)
library(e1071)

data(iris)
head(iris)
str(iris)
summary(iris)

table(iris$Species)

split=sample.split(iris$Species,SplitRatio = 0.7)
train=subset(iris,split==TRUE)
test=subset(iris,split==FALSE)
table(train$Species)
table(test$Species)

model=naiveBayes(formula=train$Species~.,data=train)
model

yp=predict(model,newdata = test)
yp

cm=table(yp,test$Species)
confusionMatrix(cm)

