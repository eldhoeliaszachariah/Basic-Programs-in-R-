library(class)
library(caTools)
library(caret)
library(readxl)

data=read_excel('Raisin_Dataset.xlsx')

head(data)
str(data)
summary(data)

table(data$Class)

split=sample.split(data$Class,SplitRatio =0.7 )
train=subset(data,split==TRUE)
test=subset(data,split==FALSE)

table(train$Class)
table(test$Class)

train_scale=scale(train[,1:7])
test_scale=scale(test[,1:7])

model=knn(train=train_scale,test=test_scale,cl=train$Class,k=3)

cm=table(model,test$Class)

confusionMatrix(cm)
