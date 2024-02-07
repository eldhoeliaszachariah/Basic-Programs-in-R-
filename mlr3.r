data("iris")
head(iris)
str(iris)

iris$species=as.numeric(as.factor(iris$Species))
tail(iris$species)

library(caTools)
set.seed(100)
split=sample.split(iris,SplitRatio = 0.7)
train=subset(iris,split==TRUE)
test=subset(iris,split==FALSE)


LM=lm(formula = species ~ ., data = train)
coef(LM)
summary(LM)

yp=predict(LM,newdata=test)
head(yp)

library(car)

avPlots(LM)

