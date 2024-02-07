data("mtcars")
head(mtcars)
str(mtcars)

plot(mtcars$hp,mtcars$mpg,xlab="hp",
      ylab="mpg",main="hp vs mpg",)

library(caTools)
split=sample.split(mtcars$mpg,SplitRatio = 0.7)
trainingset=subset(mtcars,split==TRUE)
testset=subset(mtcars,split==FALSE)
head(trainingset)
head(testset)

LM=lm(formula=mpg~hp,data=trainingset)
coef(LM)
summary(LM)

yp=predict(LM,newdata=testset)
yp

library(ggplot2)

ggplot()+geom_point(aes(x=trainingset$hp,y=trainingset$mpg),colour='red')+
    geom_line(aes(x=trainingset$hp,y=predict(LM,newdata=trainingset)),colour='blue')+
    ggtitle("hp vs mpg")+
    xlab("hp")+
    ylab("mpg")
ggplot()+geom_point(aes(x=testset$hp,y=testset$mpg),colour='red')+
    geom_line(aes(x=trainingset$hp,y=predict(LM,newdata=trainingset)),colour='blue')+
    ggtitle("hp vs mpg")+
    xlab("hp")+
    ylab("mpg")
