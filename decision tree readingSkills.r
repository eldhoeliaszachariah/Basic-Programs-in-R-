library(datasets)
library(caTools)
library(party)
library(magrittr)
library(dplyr)

data("readingSkills")
head(readingSkills)

split=sample.split(readingSkills,SplitRatio = 0.8)
train=subset(readingSkills,split==TRUE)
test=subset(readingSkills,split==FALSE)

model=ctree(nativeSpeaker~.,data=train)

plot(model)

yp=predict(model,test)

native=table(test$nativeSpeaker,yp)
native
