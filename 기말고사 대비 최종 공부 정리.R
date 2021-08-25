
## 단순연산
install.packages("ggplot2")
library(ggplot2)
x<-c(1,1,1,2,3,2,3,4,5,6)
qplot(x)

log(10)+5
sqrt(25)
max(65,4,2,4,444)
abs(-10)
factorial(66)
is.numeric(x)
height<-c(160,155,153)
name<-c("Lee","Choi","Park")
names(height)<-name
height["Lee"]

b<-seq(1,6,by=2)
b
e<-rep(1:3,4)
e
g<-paste("No.",1:5)
g

b<-c(1,3,5,7)
b<-append(b,9,after = 7)
b
b<-b[-1]
b<-b[-1:-3]
b

a<-"Hello World"
b<-"Hi"
a+b
x<-c(1,3,5,7,9)
x[2]
x[2]<-20
x
x[c(3,4)]<-21
x
x[x<=15]<-10
x


#### matrix
x<-matrix(1:6,nrow=3,byrow = F)
x
y<-matrix(11:16,nrow=3,byrow=T)
y
rbind(x,y)
xy<-cbind(x,y)
xy
colnames(xy)<-c("A","B","C","D")
rownames(xy)<-c("1","2","3")
xy
x
y
x*y
x%*%y

a<-matrix(1:4,2)
a  
b<-matrix(5:8,2)
b
a%*%b


v1<-c(1,2,3,4)
v2<-c(11,22,33,44)
v3<-c(111,222,333,444)
x<-cbind(v1,v2,v3)
x
y<-rbind(v1,v2,v3)
y


##array
a<-array(1:24,c(3,3,3))
a
b<-array(1:6)
b
c<-array(1:6,c(2,3))
c
d<-array(1:8,c(2,2,2))
d
e<-c(1:24); dim(e)<-c(3,4,2)
e
h<-array(1:24,c(3,4,2))
h

dimnames(h)<-list(c("가","나","다"),c("A","B","C","D"),c("APR1","APR2"))
h


###list

a<-list("top",c(1,2,3),c(T,F,T))
a

b<-list(c("Abe","Bob","Caro","Deb"),c("Weight","Height"))
b
names(b)<-c("Rows","Columns")
b

ds<-c(70,80,77,80)

my.info<-list(name="Yoon",age=25,score=ds,status=FALSE)
my.info

hong<-list(성명="홍길동",학번=20190102,나이=21,수강과목=c("빅데이터 분석","머신러닝","창의적 자기설계계"))
hong
hong[4]
hong["수강과목"] 


#data frame

name<-c("Lee","Jang","Ho","Yoon")
gender<-c("M","M","F","F")
age<-c(22,23,14,24)
math<-c(100,80,90,90)
English<-c(90,88,78,88)
Korean<-c(88,91,99,82)
x<-data.frame(name,gender,age,math,English,Korean,stringsAsFactors = T)
x
name<-c("Won","Jin")
gender<-c("F","M")
age<-c(22,23)
math<-c(100,90)
English<-c(99,98)
Korean<-c(89,88)
y<-data.frame(name,gender,age,math,English,Korean)
xy<-rbind(x,y)
xy
xy<-transform(xy,social=c(100,40,55,66,77,88))
xy
Lee<-xy[1,]
Lee
(Lee$math+Lee$English+Lee$Korean+Lee$social)/4
mean(Lee$math,Lee$English,Lee$Korean,Lee$social)

xy[xy$English>90,]
xy[xy$math<120,]

h<-subset(xy,select = c(name,gender,math,English,Korean,social),subset=(math>80&English>80&Korean>80))
h

xy
xyz<-xy[,c(1,2,3,7,4,5,6)]
xyz
xyzz<-xyz[c(2,4,3,1,5,6),]
xyzz


k<-data.frame("제품"=c("사과","딸기","수박"),"가격"=c(1800,2200,4400),"판매량"=c(24,38,13))
k
mean(k$가격)
mean(k$판매량)


## xlsx 불러오기

install.packages("xlsx")
library(xlsx)
library(dplyr)
library(ggplot2)
library(wordcloud)


#csv 불러오기

a<-read.xlsx("Sample_Superstore",header=T)
library(help="datasets")
help(quakes)
head(quakes,10)
str(quakes)
dim(quakes)
summary(quakes)
mpg
head(mpg)
summary(mpg)
library(dplyr)
df_raw<-data.frame(var1=c(1,2,1),var2=c(2,3,2))
df_new<-df_raw
df_new<-rename(df_new,v2=var2)
df_new

a<-data.frame(v1=c(1,2,3),v2=c(4,5,6))
a
a$vsum<-a$v1+a$v2
a
mpg
mpg_new<-rename(mpg,city=cty,highway=hwy)
head(mpg_new,10)


#if else

job.type<-'A'

if(job.type=='b'){
  bonus<-200
} else{
  bonus<-100
}
print(bonus)

job.type<-'A'
bonum<-100
if(job.type=='A'){
  bonus<-200
}
print(bonus)


#for

for(i in 1:5){
  print('$')
}

for(i in 1:6){
  print(i)
}

#구구단 만들기

for(i in 1:9){
  cat('7*',i,'=',7*i,'\n')
}


for(i in 1:20){
  if(i%%2==0){
    print(i)
  }
}
sum<-0
for(i in 1:100){
  sum<-sum+i
}
print(sum)

# while

sum<-0
i<-1
while (i<=100) {
  sum<-sum+i
  i<-i+1
  
}
print(sum)

#break & next

sum<- 0
for(i in 1:10){
  sum<-sum+i
  if(i>=5) break
}
print(sum)

sum<-0
for (i in 1:10) {
  if(i%%2==0) next
  sum<-sum+i

  
}
sum


#apply

apply(iris[,1:4],1,mean)
apply(iris[,1:4],2,mean)

#mpg total

mpg
mpg$total<-(mpg$cty+mpg$hwy)/2
mean(mpg$total)
hist(mpg$total)

mpg$test<-ifelse(mpg$total>=20,"Pass","Fail")
mpg$test
table(mpg$test)

qplot(mpg$test)


## airquality의 과제

str(airquality)
head(airquality,10)

max(airquality$Temp)
summary(airquality)
airquality$temp_test<-ifelse(airquality$Temp>=97,"Pass","Fail")
airquality$temp_test
airquality$temp_test["Pass"]

data<-airquality
data
str(data)

class(data)

#3
max_temp<-max(data$Temp)

data[data$Temp == max_temp,c('Month','Day')]

subset(data,Temp==max_temp,select = c('Month','Day'))

#4
data[data$Month==6,"Wind"]
max(data[data$Month==6,"Wind"])

#5
mean(data[data$Month==7,"Temp"])
round(mean(data[data$Month==7,'Temp']))

#6
data[data$Month==5 & !is.na(data$Ozone),]

data_rna<-data[data$Month==5 & !is.na(data$Ozone),]
data_rna
mean(data_rna$Ozone)
mean(data_rna$Ozone, na.rm = T)

#7
data[data$Ozone >100&!is.na(data$Ozone),]
ozone100<-data[data$Ozone >100&!is.na(data$Ozone),]

nrow(ozone100)



#단일변수 범주형 자료의 탐색

favorite<-c('winter','winter','summer','spring','summer','winter','fall','fall')
table(favorite)
table(favorite)/length(favorite)  #도수분포표

ds<-table(favorite)

barplot(ds,main='favorite Season')#막대그래프

pie(ds,main='favorite season') #원 그래프

#숫자로 표현된 범주자료

favorite.color<-c(2,3,2,1,1,2,2,1,3,2,1,3,2,1,2)
ds<-table(favorite.color)

barplot(ds,main = 'favorite color')

colors<-c('green','red','blue')
names(ds)<-colors

ds

barplot(ds,main = 'favorite color',col=colors)
pie(ds,main = 'favorite color',col=colors)


## 다중변수의 탐색적 분석

library(mlbench)
data("BostonHousing")
myds<-BostonHousing[,c("crim","rm","dis","tax","medv")]
str(myds)

grp<-c()
for(i in 1:nrow(myds)){
  if(myds$medv[i]>=25.0){
    grp[i]<-"H"
  } else if (myds$medv[i]<=17.0){
    grp[i]<-"L"
  } else{
    grp[i]<-"M"
  }
}

grp<-factor(grp)
grp<-factor(grp,levels=c("H","M","L"))

myds<-data.frame(myds,grp)
head(myds)

par(mfrow=c(2,3))
for (i in 1:5) {
  hist(myds[,i],main=colnames(myds)[i],col = "Green")
  
}
par(mfrow=c(1,1))

boxplot(myds$crim)

par(mfrow=c(2,3))
for (i in 1:5) {
  boxplot(myds[,i],main=colnames(myds)[i])
}

#그룹별 관측값 분포 확인
boxplot(myds$crim~myds$grp)

boxplot(myds$tax~myds$grp)

pairs(myds[,-6])


cor(myds[,-6])



# dplyr
exam<-read.csv("csv_exam.csv")
exam
exam %>% filter(class==1)
exam %>% filter(class==1&math>=50)

exam %>% filter(math>=90 | english>=90)

exam %>% filter(class==2&english>=80)
class1<-exam %>% filter(class==1)
class2<-exam %>% filter(class==2)

mean(class1$math)
mean(class2$math)


exam %>% select(class,math,english)

exam %>% filter(class==1) %>% select(english)


exam %>% summarise(mean_math=mean(math))

exam %>% group_by(class) %>% summarise(mean_math=mean(math))
exam %>% group_by(class) %>% summarise(mean_math=mean(math),
                                       sum_math=sum(math),
                                       median_math=median(math),
                                       n=n())

mpg %>% group_by(manufacturer,drv) %>% summarise(mean_cty=mean(cty)) %>% head(10)



#na 값 확인

df<-data.frame(sex=c('M','F',NA,'M','F'),score=c(5,4,3,4,NA))
df
table(is.na(df))
df %>% filter(is.na(score))
df %>% filter(!is.na(score)&!is.na(sex)) # na 결측치 제거

na.omit(df) #결측치 모두 제거하는 것

df

exam %>% summarise(mean_math=mean(math,na.rm = T))#결측치 빼고 평균구하기

table(mpg$class)

mpgcty_class<-mpg %>% select(cty,class)

mpgcty_class %>% group_by(class) %>% summarise(mean_cty=mean(cty))
mpg_suv<-mpgcty_class %>% filter(class=="suv")
mpg_compact<-mpgcty_class %>% filter(class=="compact")
mean(mpg_compact$cty)
mean(mpg_suv$cty)


##ggplot



## Lee text분석

library(KoNLP)
useSejongDic()
library(wordcloud)
library(dplyr)
#파일불러오기
text <- readLines("lee.txt", encoding = "UTF-8")
head(text)

#명사추출
noun <- sapply(text, extractNoun, USE.NAMES=F)
noun2 <- unlist(noun)

#빈도를 정렬해서 지울 단어 확인하기
sort(table(noun2), decreasing = T)[1:20]

#데이터 전처리하기
noun2 <- gsub('우리'," ",noun2 )
noun2 <- gsub('하게'," ",noun2 )
noun2 <- gsub('모두'," ",noun2 )
noun2 <- gsub('들',"",noun2)

#한 단어 이하 인 단어 버리기 
noun2 <- Filter(function(x){nchar(x) >=2}, noun2)
sort(table(noun2), decreasing = T)[1:30]

word_count <- table(noun2)

word_count

str(word_count)


df_word <- as.data.frame(word_count, StringAsFactors=F)

df_word

df_word <- rename(df_word, word=noun2, freq=Freq)

top20 <- df_word %>% arrange(desc(freq)) %>%  head(20)
df_word_top20<-top20

pal2 <- brewer.pal(8,"Dark2")


wordcloud(names(word_count),freq=word_count,scale = c(4,1),min.freq = 3,random.order = F,colors = pal2)

wordcloud(names(word_count),freq=word_count,scale = c(4,1),min.freq = 3,random.order = F,colors = pal2)


wordcloud(df_word_top20$word,
          freq = df_word_top20$freq,
          min.freq = 2,
          random.order = F,
          rot.per = .1,
          scale=c(6,0.3),
          colors = pal2)


library(ggplot2)

order<-arrange(top20,freq)$word

ggplot(data=top20,aes(x=word,y=freq))+
  ylim(0,40)+
  geom_col()+
  coord_flip()+
  scale_x_discrete(limit=order)+
  geom_text(aes(label=freq),hjust=-0.3)

ggplot(data=top20,aes(x=word,y))