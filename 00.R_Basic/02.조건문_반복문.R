##### 조건문
a = 333
b = 200
if (a < b) {
    print('a가 b보다 작다')
}

if (a < b) {
    print('a가 b보다 작다')
} else if (a == b) {
    print('a가 b와 같다')
} else {
    print('a가 b보다 크다')
}


##### While 반복문
# 1에서 몇까지 더하면 1000을 넘길까?
i = 1
cum.sum = 0
while(cum.sum <= 1000) {
    cum.sum =cum.sum + i
    i = i + 1
}
print(paste(i, cum.sum))    # 46 1035

cum.sum = 0
i = 1
while(TRUE) {
    if (cum.sum >= 1000) 
        break
    cum.sum = cum.sum + i
    i = i + 1
}
print(paste(i, cum.sum))    # 46 1035

# continue : next

##### for 반복문
for (x in 1:10) {           # 1 ~ 10 까지의 sequence
    print(x)
}  

# vector
dice = c(1, 2, 3, 4, 5, 6)
for (x in dice) {
    print(x)
}

# list
fruits = list('apple', 'banana', 'cherry')
for (fruit in fruits) {
    print(fruit)
}

# sequence
for (i in seq(1, 10, 2)) {
    print(i)
}
for (i in 1:10) {
    if (i%%2 == 0)
        next
    print(i)
}

