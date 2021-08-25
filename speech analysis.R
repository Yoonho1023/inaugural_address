
#################################
#################################
#########워드 클라우드###########
#################################

install.packages("wordcloud")
library(wordcloud)

word<- c("대한", "민국", "빅데이터", "만세")
frequency <- c(651, 85, 61, 100)

wordcloud(word, frequency, colors="blue")


# 단어들의 색 변환
wordcloud(word, frequency, random.order=F, random.color=F, colors=rainbow(length(word)))


# 다양한 단어 색 출력을 위한 팔레트 패키지의 활용
install.packages("RColorBrewer")
library(RColorBrewer)      

pal2 <- brewer.pal(8,"Dark2")

word<- c("대한", "민국", "빅데이터", "만세")
frequency <- c(651, 85, 61, 100)

wordcloud(word, frequency, colors=pal2)

display.brewer.all()


###########################################
# 연설문의 단어에 대한 워드 클라우드 만들기
###########################################

install.packages("KoNLP")  
install.packages("RColorBrewer")
install.packages("wordcloud")

library(KoNLP)
library(RColorBrewer)
library(wordcloud)
library(dplyr)

#세종 사전
useSejongDic()  


#  txt 파일 불러오기 
text <- readLines('speech.txt')
text 



# 파일에서 명사 추추
noun <- sapply(text, extractNoun, USE.NAMES=F)
mode(noun)

noun2 <- unlist(noun) 
noun2
head(noun2,10)

# 사전에 단어 추가 및 추출된 명사의 삭제

noun2 <- gsub("여러분", "", noun2)
noun2 <- gsub("우리", "", noun2)
noun2 <- gsub("오늘", "", noun2)
noun2 <- gsub("필요", "", noun2)
noun2 <- gsub("대통령", "", noun2)

# 두 글자 이상만 추출
noun2 <- Filter(function(x){nchar(x) >= 2}, noun2)


# 워드 카운트 정리
word_count <- table(noun2) 
sort(word_count, decreasing = T)

# 순서대로 정렬해서 10개만 출력 
head(sort(word_count, decreasing=TRUE), 20)

df_word <- as.data.frame(word_count, stringsAsFactors = F)
df_word

library(dplyr)

df_word <- rename(df_word,
                  word = noun2,
                  freq = Freq)

top20 <- df_word %>%
  arrange(desc(freq)) %>%
  head(20)

top20

names(word_count)
word_count

pal2 <- brewer.pal(8,"Dark2")  

wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=3, random.order=F,rot.per=.1,colors=pal2)

wordcloud(words = df_word$word,    # 단어
          freq = df_word$freq,     # 빈도
          min.freq = 3,           # 최소 단어 빈도
          random.order = F,        # 고빈도 단어 중앙 배치
          rot.per = .1,            # 회전 단어 비율
          scale = c(6, 0.3),      # 단어 크기 범위
          colors = pal2)           # 색상 목록

library(ggplot2)

order <- arrange(top20, freq)$word              # 빈도 순서 변수 생성  
ggplot(data = top20, aes(x = word, y = freq)) +   
ylim(0, 40) +   
geom_col() +   
coord_flip() +   
scale_x_discrete(limit = order) +     # 빈도 순서 변수 기준 막대 정렬   
  geom_text(aes(label = freq), hjust = -0.3)     # 빈도 표시






