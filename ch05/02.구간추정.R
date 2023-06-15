##### 구간 추정
### 모평균에 대한 구간 추정, 모집단의 표준 편차를 알고 있을 때
options(digits=4)
set.seed(9)
n = 10 
x = 1:100
y = seq(-3, 3, by=0.01)

smps = matrix(rnorm(n * length(x)), ncol=n)
head(smps)
xbar = apply(smps, 1, mean)
xbar
length(xbar)
se = 1 / sqrt(n)        # 모집단의 표준편차가 1
alpha = 0.05            # 유의 수준
z = qnorm(1 - alpha/2)
ll = xbar - z * se
ul = xbar + z * se

plot(y, type='n', xlab='표본추출', ylab='z', 
     xlim=c(1,100), ylim=c(-1.5, 1.5), cex.lab=1.8)
abline(h=0, col='red', lwd=2, lty=2)
line.col = rep(NA, 100)
line.col = ifelse(ll * ul > 0, 'red', 'black')
arrows(1:length(x), ll, 1:length(x), ul, code=3,
       angle=90, length=0.02, col=line.col, lwd=1.5)


for (df in 1:10) {
    print(paste(df, qt(0.975, df=df)))
}

##### 모분산을 모를때 모평균에 대한 95% 신뢰구간
smp = c(520, 498, 481, 512, 515, 542, 520, 518, 527, 526)
len = length(smp)
xbar = mean(smp)
s = sd(smp)
t = qt(1 - 0.05/2, df=len-1)
ll = xbar - t * s / sqrt(len)
ul = xbar + t * s / sqrt(len) 
print(paste('신뢰수준:', '95%'))
print(paste('하한:', round(ll, 4)))
print(paste('평균:', round(xbar, 4)))
print(paste('상한:', round(ul, 4)))
