df=read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(df)

sum(is.na(df))

df$rank=as.factor(df$rank)

lr=glm(admit~gre+gpa+rank,data=df,family="binomial")
summary(lr)

x=data.frame(gre=790,gpa=3.8,rank=as.factor(1))
p=predict(lr,x)
p
