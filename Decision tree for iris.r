library(rpart)
library(rpart.plot)

data(iris)
str(iris)

decision_tree=rpart(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,data=iris,method='class')

print(decision_tree)

rpart.plot(decision_tree,main="DECISION TREE FOT IRIS")
