load('data/pop.rda')
head(pop)
tableV1 = table(pop$V1)
barplot(tableV1, main='남녀 인구수', xlab='성별', ylab='인구')

tableV5 = table(pop$V5)
tableV5

# 막대그래프
barplot(tableV5, main='출생아(남자)별 빈도',
        xlab='출생아수', ylab='빈도')

# 히스토그램
hist(pop$V2, main='연령별 분포', xlab='연령', ylab='빈도')

hist(pop$V2, breaks=seq(0, 90, 10), right=F,
     main='연령별 분포', xlab='연령', ylab='빈도')

# 영역을 다 더하면 1이 되는
hist(pop$V2, breaks=seq(0, 90, 10), probability=T,
     main='연령별 분포', xlab='연령', ylab='밀도')

# 원 도표
tableV4 = table(pop$V4)
tableV4
# cex : 이름표 크기 0.8배 축소
pie(tableV4, main='학력수준별 비중', cex=0.8)





 
