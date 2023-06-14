### 표본 평균 Xbar의 분포
m10 = rep(NA, 1000) # m10, 표본의 크기가 10인 것의 평균, 1000번
m40 = rep(NA, 1000) # m40, 표본의 크기가 40인 것의 평균, 1000번

set.seed(9)
for (i in 1:1000) {
    m10[i] = mean(rnorm(10))
    m40[i] = mean(rnorm(40))
}

# 표본 평균의 평균과 표준편차
options(digits=4)
c(mean(m10), sd(m10))
c(mean(m40), sd(m40))

# 그림1
par(mfrow=c(1, 2))
hist(m10, xlim=c(-1.5, 1.5), main='표본의 크기: 10', 
     xlab='x', ylab='y', col='cyan', border='blue')

hist(m40, xlim=c(-1.5, 1.5), main='표본의 크기: 40', 
     xlab='x', ylab='y', col='cyan', border='blue')
par(mfrow=c(1, 1))
# 그림2   
par(mfrow=c(2, 1))  # 여러개의 그림, (행의 갯수, 열의 갯수)
hist(m10, xlim=c(-1.5, 1.5), main='표본의 크기: 10', 
     xlab='x', ylab='y', col='cyan', border='blue')

hist(m40, xlim=c(-1.5, 1.5), main='표본의 크기: 40', 
     xlab='x', ylab='y', col='cyan', border='blue')
par(mfrow=c(1, 1)) 