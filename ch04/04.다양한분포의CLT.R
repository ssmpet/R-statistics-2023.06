#windowsFont(malgun='맑은 고딕')
#par(mfrow=c(1, 1), family='malgun', oma=c(0,0,0,0))

# t분포: 평균 0, 분산 df/(df-2) (df>2)
# X2분포 : 평균 df, 분산 sqrt(2*df)
# F분포 : 평균 df2/(df2-2) (df2>2)

options(digits=4)
n = 1000
df = 5; df2 = 10

### t-분포(자유도)
t2.mean = rep(NA, n)
t4.mean = rep(NA, n)
t16.mean = rep(NA, n)
t32.mean = rep(NA, n)
for (i in 1:n) {
    t2.mean[i] = mean(rt(2, df=df))
    t4.mean[i] = mean(rt(4, df=df))
    t16.mean[i] = mean(rt(16, df=df))
    t32.mean[i] = mean(rt(32, df=df))
}

c(mean(t2.mean), sd(t2.mean))       # -0.03106  0.96470     sqrt(5/3)/sqrt(2)
c(mean(t4.mean), sd(t4.mean))       # -0.008189  0.670840
c(mean(t16.mean), sd(t16.mean))     # 0.006835 0.314264
c(mean(t32.mean), sd(t32.mean))     # -0.007545  0.232328


# t-분포(자유도-5)의 평균과 표준편차 
m = 0
s= sqrt(5/(5-2))
c(m, s)

par(mfrow=c(2,2), oma=c(0,0,2,0))
hist(t2.mean, prob=T, main='표본크기: 2', ylab='', xlab='',
     col='orange', border='red')
x1 = seq(min(t2.mean), max(t2.mean), length=1000)
y1 = dnorm(x1, m, s/sqrt(2))
lines(x1, y1, lty=2, lwd=2, col='blue')


hist(t4.mean, prob=T, main='표본크기: 4', ylab='', xlab='',
     col='orange', border='red')
x2 = seq(min(t4.mean), max(t4.mean), length=1000)
y2 = dnorm(x2, m, s/sqrt(4))
lines(x2, y2, lty=2, lwd=2, col='blue')

hist(t16.mean, prob=T, main='표본크기: 16', ylab='', xlab='',
     col='orange', border='red')
x3 = seq(min(t16.mean), max(t16.mean), length=1000)
y3 = dnorm(x3, m, s/sqrt(16))
lines(x3, y3, lty=2, lwd=2, col='blue')


hist(t32.mean, prob=T, main='표본크기: 32', ylab='', xlab='',
     col='orange', border='red')
x4 = seq(min(t32.mean), max(t32.mean), length=1000)
y4 = dnorm(x4, m, s/sqrt(32))
lines(x4, y4, lty=2, lwd=2, col='blue')

mtext('t 표본평균의 분포(자유도=5)', outer=T, cex=1.2)


### 카이제곱 분포(자유도=5)
chi2.mean = rep(NA, n)
chi4.mean = rep(NA, n)
chi16.mean = rep(NA, n)
chi32.mean = rep(NA, n)
for (i in 1:n) {
    chi2.mean[i] = mean(rchisq(2, df=df))
    chi4.mean[i] = mean(rchisq(4, df=df))
    chi16.mean[i] = mean(rchisq(16, df=df))
    chi32.mean[i] = mean(rchisq(32, df=df))
}

# 카이제곱 분포(자유도-5)의 평균과 표준편차
m = df
s = sqrt(2 * df)

par(mfrow=c(2,2), oma=c(0,0,2,0), family='malgun')
hist(chi2.mean, prob=T, main='표본크기: 2', ylab='', xlab='',
     col='orange', border='red')
x1 = seq(min(chi2.mean), max(chi2.mean), length=1000)
y1 = dnorm(x1, m, s/sqrt(2))
lines(x1, y1, lty=2, lwd=2, col='blue')

hist(chi4.mean, prob=T, main='표본크기: 4', ylab='', xlab='',
     col='orange', border='red')
x2 = seq(min(chi4.mean), max(chi4.mean), length=1000)
y2 = dnorm(x2, m, s/sqrt(4))
lines(x2, y2, lty=2, lwd=2, col='blue')

hist(chi16.mean, prob=T, main='표본크기: 16', ylab='', xlab='',
     col='orange', border='red')
x3 = seq(min(chi16.mean), max(chi16.mean), length=1000)
y3 = dnorm(x3, m, s/sqrt(16))
lines(x3, y3, lty=2, lwd=2, col='blue')

hist(chi32.mean, prob=T, main='표본크기: 32', ylab='', xlab='',
     col='orange', border='red')
x4 = seq(min(chi32.mean), max(chi32.mean), length=1000)
y4 = dnorm(x4, m, s/sqrt(32))
lines(x4, y4, lty=2, lwd=2, col='blue')

mtext('카이제곱 표본평균의 분포(자유도=5)', outer=T, cex=1.2)


### F-분포(자유도1=5, 자유도2=10)
f2.mean = rep(NA, n)
f4.mean = rep(NA, n)
f16.mean = rep(NA, n)
f32.mean = rep(NA, n)

for (i in 1:n) {
    f2.mean[i] = mean(rf(2, df1=df, df2=df2))
    f4.mean[i] = mean(rf(4, df1=df, df2=df2))
    f16.mean[i] = mean(rf(16, df1=df, df2=df2))
    f32.mean[i] = mean(rf(32, df1=df, df2=df2))
}

# F-분포(자유도1=5, 자유도2=10)의 평균과 표준편차
m = df2 / (df2 - 2)
s = sqrt(2 * df2^2 * (df + df2 -1) / (df  * (df2 - 2)^2 * (df2 - 4))) 
    
par(mfrow=c(2,2), oma=c(0,0,2,0), family='malgun')
hist(f2.mean, prob=T, main='표본크기: 2', ylab='', xlab='',
     col='orange', border='red')
x1 = seq(min(f2.mean), max(f2.mean), length=1000)
y1 = dnorm(x1, m, s/sqrt(2))
lines(x1, y1, lty=2, lwd=2, col='blue')

hist(f4.mean, prob=T, main='표본크기: 4', ylab='', xlab='',
     col='orange', border='red')
x2 = seq(min(f4.mean), max(f4.mean), length=1000)
y2 = dnorm(x2, m, s/sqrt(4))
lines(x2, y2, lty=2, lwd=2, col='blue')

hist(f16.mean, prob=T, main='표본크기: 16', ylab='', xlab='',
     col='orange', border='red')
x3 = seq(min(f16.mean), max(f16.mean), length=1000)
y3 = dnorm(x3, m, s/sqrt(16))
lines(x3, y3, lty=2, lwd=2, col='blue')

hist(f32.mean, prob=T, main='표본크기: 32', ylab='', xlab='',
     col='orange', border='red')
x4 = seq(min(f32.mean), max(f32.mean), length=1000)
y4 = dnorm(x4, m, s/sqrt(32))
lines(x4, y4, lty=2, lwd=2, col='blue')

mtext('F 표본평균의 분포(자유도1=5, 자유도2=10)', outer=T, cex=1.2)

par(mfrow=c(1,1))




