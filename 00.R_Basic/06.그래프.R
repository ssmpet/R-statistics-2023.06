##### 산점도
plot(c(1:10), c(2,3,6,7,3,5,8,1,9,3), 
     pch='o',       # 점의 모양  ( 0 ~ 25 )
     col='red',     # 점의 색상
     xlab = 'x축 제목', ylab = 'y축 제목',   # X축, Y축 제목
     main='산점도(Scatter Plot)')            # 제목


##### Line graph
# lty(0 ~ 6)
plot(c(1:10), c(2,3,6,7,3,5,8,1,9,3), 
     type = 'l',    # 선 그래프
     lwd=3,         # 선의 굵기
     col='blue',    # 선의 색상
     xlab = 'x축 제목', ylab = 'y축 제목', 
     main='선 그래프') 


##### Pie chart
x = c(10, 20, 30, 40)
pie(x, init.angle=90, 
    label=c("Apples", "Bananas", "Cherries", "Dates"),
    main='내가 좋아하는 과일')

##### Bar chart
x = c('A', 'B', 'C', 'D')
y = c(3, 4, 6, 7)
barplot(y, names.arg=x, col='red')


pairs(iris[1:4], main="Anderson's Iris Data -- 3 species",
      pch=21, bg=c("red", "green3", "blue")[unclass(iris$Species)])

     
