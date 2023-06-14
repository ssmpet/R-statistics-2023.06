##### 확률분포
### 이항 분포 (Binomial Distribution)
n = 6
p = 1/3
x = 0:n     # B(6, 1/3)

# 확률 질량함수 nCx p^x (1-p)^(6-x)
dbinom(2, n, p)     # 6C2 (1/3)^2 (1-1/3)^(6-2)
dbinom(x=4, size=n, prob=p)
px = dbinom(x, n, p)
px
plot(x, px, type='s', xlab='성공 횟수', ylab='확률(P[X=x]', main='B(6, 1/3)')
plot(x, px, type='h', xlab='성공 횟수', ylab='확률(P[X=x]', main='B(6, 1/3)', lwd=20, col='red')

# 누적 분포함수
pbinom(2, n, p)     # dbinom(0,n,p) + dbinom(1,n,p) + dbinom(2,n,p)
# 성공횟수가 1~3 인 확률
dbinom(1,n,p) + dbinom(2,n,p) + dbinom(3,n,p)
pbinom(3,n,p) - pbinom(0,n,p)

# 누적확률 값이 p가 될 때의 x값을 찾아주는 함수
qbinom(p=0.1, n, p)
qbinom(p=0.5, n, p)

# 이항분포를 따르는 n개의 표본 추출
set.seed(2023)
rbinom(10, n, p)

# 기댓값과 분산
n = 6
p = 1/3
x = 0:n     # B(6, 1/3)
px = dbinom(x, n, p)
ex = sum(x * px)    # Expectation value 기댓값
ex
ex2 = sum(x^2 * px)
ex2
varx = ex2 - ex^2   # Variation 분산
varx


### 정규분포
# 어느 대학교 남학생 키의 평균은 170cm, 표준편차는 6인 정규분포를 따른다. 
# 180cm보다 큰 학생의 확률은?
options(digits=4)
mu = 170
sigma = 6
ll = mu - 3*sigma   # lower limit
ul = mu + 3*sigma   # upper limit
x = seq(ll, ul, by=0.01)
y = dnorm(x, mean=mu, sd=sigma)
plot(x, y, type='l', xlab='남학생의 키', ylab='P[X=x]',
     lwd=2, col='red', main='N(170, 6^2)')

prob = round(pnorm(180, 170, 6), 4)
print(paste('180cm보다 큰 학생의 확률은 ', 1-prob, '입니다.'))

# 상위 10%에 속하려면 키가 얼마이어야 하는가?
height = qnorm(0.9, mu, sigma)                  # 177.7
height

# 키가 165cm ~ 175cm일 확률
pnorm(175, mu, sigma) - pnorm(165, mu, sigma)   # 0.5953

# 95%에 속하는 학생들의 키 범위는?
ll = round(qnorm(0.025, mu, sigma), 4)
ul = round(qnorm(0.975, mu, sigma), 4)
print(paste(ll, '~', ul, '(cm)'))               # 158.2402 ~ 181.7598 (cm)

# 400개의 난수를 생성하여 모집단과 비교
set.seed(2023)
smp = rnorm(400, 170, 6)
print(paste(mean(smp), sd(smp)))
hist(smp, prob=T, main='N(170, 6^2)으로부터 추출한 표본의 분포(n=400)',
     xlab='', ylab='', col='white', border='black')

lines(x, y, lty=2, lwd=2, col='red')

## 정규분포의 특징
mu = 0
sigma = 1
p0.05 = qnorm(0.95)     # qnorm(0.95) 와 부호가 반대인 값
p0.05                   # 90% 신뢰수준

pnorm(1.96) - pnorm(-1.96)
p0.025 = qnorm(0.975)
p0.025                  # 95% 신뢰수준
qnorm(0.995)            # 99% 신뢰수준
pnorm(2.576) - pnorm(-2.576)

# 95% 신뢰구간 그림
z = seq(-3, 3, by=0.001)
z.p = dnorm(z)
plot(z, z.p, axes=F, type='l',
     main='표준정규분포(95%)', ylab='', ylim=c(-0.04, 0.4))
axis(1)

lines(c(-3, 3), c(0, 0))
points(-1.96, -0.02, pch=17, col='red')
text(-1.96, -0.035, "-1.96", col="red")
points(1.96, -0.02, pch=17, col="red")
text(1.96, -0.035, "1.96", col="red")

s <- seq(-1.96, 1.96, by=0.001)
s.z <- dnorm(s, mean=0, sd=1)
s <- c(-1.96, s, 1.96)
s.z <- c(0, s.z, 0)
polygon(s, s.z, col="red", density=10, angle=305)
 

# 90% 신뢰구간 그림 : 다시확인
z = seq(-3, 3, by=0.001)
z.p = dnorm(z)
plot(z, z.p, axes=F, type='l',
     main='표준정규분포(90%)', ylab='', ylim=c(-0.05, 0.5))
axis(1)

lines(c(-3, 3), c(0, 0))
points(-1.65, -0.02, pch=17, col='red')
text(-1.65, -0.05, "-1.65", col="red")
points(1.65, -0.02, pch=17, col="red")
text(1.65, -0.05, "1.65", col="red")

s <- seq(-1.65, 1.65, by=0.001)
s.z <- dnorm(s, mean=0, sd=1)
s <- c(-1.65, s, 1.65)
s.z <- c(0, s.z, 0)
polygon(s, s.z, col="red", density=10, angle=305)
