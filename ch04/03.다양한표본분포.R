##### T분포
windowsFont(malgun='맑은 고딕')
par(mfrow=c(1, 1), family='malgun', oma=c(0,0,0,0))
x = seq(-3, 3, by=0.01)
y = dnorm(x)            # 표준정규분포
t1 = dt(x, df=1)        # 자유도가 1인 T분포
t2 = dt(x, df=2)
t8 = dt(x, df=8)
t30 = dt(x, df=30)

plot(x, y, type='l', lty=1, axes=F, xlab='x', ylab='', col='red')
axis(1)
lines(x, t1, lty=4, col='black')
lines(x, t2, lty=3, col='magenta')
lines(x, t8, lty=2, col='blue')
lines(x, t30, lty=6, col='green')
legend('topright', paste('df:', c(1, 2, 8, 30)), lty=c(4, 3, 2, 6), 
       col=c('black', 'magenta', 'blue', 'green'), cex=0.7)

##### 카이제곱 분포
x = seq(0, 20, by=0.01)
ch1 = dchisq(x, df=1)
ch3 = dchisq(x, df=3)
ch5 = dchisq(x, df=5)
ch10 = dchisq(x, df=10)

plot(x, type='n', xlim=c(0, 20), ylim=c(0, 0.3), main='',
     xlab='x', ylab='', axes=F)
axis(1); axis(2)
lines(x, ch1, lwd=2, lty=1, col='black')
lines(x, ch3, lwd=2, lty=2, col='red')
lines(x, ch5, lwd=2, lty=3, col='blue')
lines(x, ch10, lwd=2, lty=4, col='green')
legend('topright', paste('df:', c(1, 3, 5, 10)), lty=c(1, 2, 3, 4), 
       col=c('black', 'red', 'blue', 'green'), cex=0.7)


##### F 분포
x = seq(0, 2, by=0.01)
f3.5 = df(x, df1=3, df2=5)
f3.20 = df(x, df1=3, df2=20)
f10.5 = df(x, df1=10, df2=5)
f10.20 = df(x, df1=10, df2=20)

plot(x, f3.5, type='l', ylim=c(0, 0.9), lwd=2, axes=F, xlab='x', ylab='')
axis(1); axis(2)
lines(x, f3.20, lwd=2, lty=2, col='red')
lines(x, f10.5, lwd=2, lty=3, col='green')
lines(x, f10.20, lwd=2, lty=4, col='magenta')
legend('topright', paste('df:', c('3, 5', '3, 20', '10, 5', '10, 20')), lty=c(1, 2, 3, 4),
       col=c('black', 'red', 'green', 'magenta'), cex=0.7)





