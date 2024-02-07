library(randomForest)
library(dplyr)
library(readxl)

data=read_excel("RAISIN_DATASET.xlsx")
head(data)
str(data)

sum(is.na(data))

table(data$Class)

data=mutate(data)

library(caTools)

split=sample.split(data$Class,SplitRatio = 0.7)
train=subset(data,split==TRUE)
test=subset(data,split==FALSE)

tree=randomForest(as.factor(train$Class)~.,data=train,mtyr=5,
                    ntree=2000,importance=TRUE)
tree
summary(tree)

yp=predict(tree,newdata=test)
table(yp,test$Class)

importance(tree)

plot(tree)

varImpPlot(tree)
