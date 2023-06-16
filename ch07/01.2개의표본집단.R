##### 모집단이 2개인 경우의 평균 비교 검정

### 독립 표본: 2 sample T test
data = read.table('data/chapter7.txt', header=T)
head(data)

girl = subset(data, gender==1)
boy = subset(data, gender==2)
c(mean(girl$weight), mean(boy$weight))
# 정규성 테스트
shapiro.test(girl$weight)   # p-value: 0.02
shapiro.test(boy$weight)    # p-value: 0.2
qqnorm(boy$weight)
qqline(boy$weight)

# 등분산성 테스트
var.test(data$weight ~ data$gender)     # p-value: 0.08 ==> 분산이 같다라고 봄

# 2-sample T test
t.test(data$weight ~ data$gender, mu=0, alternative='less', var.equal=T)
# p-value: 0.07 ==> 귀무가설 채택, 차이가 없다.


### 대응 표본: paired T test
# 식욕부진 치료요법의 효과 검증
data = read.csv('data/anorexia.csv')
head(data)

# data$Prior - data$Post
t.test(data$Prior, data$Post, paired=T, alternative='less')
# p-value: 0.0004
# 귀무가설 기각, 대립가설 채택
# 신경성 식용부진증 치료요법은 효과가 있다.
