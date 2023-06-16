##### 단일 모집단의 가설 검정
#Z = (x-u)/a, (x-u)/(a/sqrt(n))
### 단일 모집단의 평균검정(1-sample T test)
df = read.table('data/babyboom.dat.txt', header=F)
names(df) = c('time', 'gender', 'weight', 'minute')
head(df)
girl_baby = subset(df, gender==1) # df[df$gender == 1, ]
weight = girl_baby[[3]]
weight

barx = mean(weight)
s = sd(weight)
n = length(weight)
mu0 = 2800
t = (barx - mu0) / (s/ sqrt(n))
t

# 임계값과 유의확률
alpha = 0.05
upper.limit = qt(1 - alpha, df=n-1)
upper.limit
# 판정
if (t > upper.limit){
    print('귀무가설 기각')
    print('여자 신생아의 체중이 2800보다 크다.')
} else {
    print('귀무가설 채택')
    print('여자 신생아의 체중이 2800보다 크지 않다.')
}

p.value = 1 - pt(t, df=n-1)
p.value
# 판정
if (p.value < alpha) {
    print('귀무가설 기각')
    print('여자 신생아의 체중이 2800보다 크다.')
} else {
    print('귀무가설 채택')
    print('여자 신생아의 체중이 2800보다 크지 않다.')
}

# R
t.test(weight, mu=2800, alternative='greater')
# p-value가 0.02가 나왔으므로 귀무가설 기각

###################################################
# 정규성 검정 - 표본이 정규성을 가져야 1-sample T test를 할 수 있음.
###################################################
shapiro.test(weight)
# p-value 가 0.05 이상이어야 정규성을 가진다고 볼 수 있음.
# weight 경우는 p-value가 0.02 이므로 정규성을 가진다고 볼 수 없다.
# 이런 경우에는 비모수 검정등 고급 통계에서 다루는 방법을 사용해야 한다.

qqnorm(weight)
qqline(weight)
# 데이터가 직선 근처에 있으면 정규성을 가진다고 볼 수 있음.

# 정규성을 갖는 데이터 예
x <- c(25, 16, 44, 82, 36, 58, 18, 40, 63) 
mean(x)
shapiro.test(x)
qqnorm(x)
qqline(x, col='red')

### 단일 모비율의 검정
bb = read.table('data/restitution.txt', header=T)
head(bb)
rel = ifelse(bb$rst < 0.4134 | bb$rst > 0.4374, 1, 0)

# 검정 통계량 계산
n = length(rel)
nos = sum(rel) 
nos
phat = nos / n
p0 = 0.1
z = (phat - p0) / sqrt(p0 * (1 - p0) / n)  # 0.3333

# 임계값과 유의확률
alpha = 0.05
upper.limit = qnorm(1 - alpha)              # 1.645
p.value = 1 - pnorm(z)                      # 0.369
c(upper.limit, p.value)

# 검정통계량 z 가 upper limit 보다 작으므로 귀무가설 채택
# 유의확률 p-value가 0.05 보다 크므로 귀무가설 채택

# R: prop.test
prop.test(nos, n, p=0.1, alternative='greater', correct=F)

# 도표 출력 : 그림 6-9
par(mar=c(0,1,1,1))
x <- seq(-3, 3, by=0.001)
y <- dnorm(x)
plot(x, y, type="l", axes=F, ylim=c(-0.02, 0.4), 
     main="", xlab="z", ylab="")
abline(h=0)

polygon(c(upper.limit, x[x>upper.limit], 3), c(0, y[x>upper.limit], 0), col=2)
text(upper.limit, -0.02, expression(z[0.05]==1.645))

polygon(c(z, x[x>z], 3), c(0, y[x>z], 0), density=20, angle=45)
text(z, -0.02, paste("z=", round(z, 3)))
text(1.2, 0.3, paste("P(Z>z)=", round(p.value, 3)), cex=0.8)

