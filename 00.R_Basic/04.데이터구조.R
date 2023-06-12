##### Vectors
fruits = c('apple', 'banana', 'cherry')
numbers = c(1, 2, 3L)   # integer 3L이 numeric으로 자동 타입 반환됨
numbers

seqs = 1:10     # 시작:끝
seqs
seqs = 6:1  
seqs

nums = 1.5:5.9  # 1씩 늘어난다.
print(nums)
nums = 1.5:6.3
print(nums)

# Sequence
seq(from=1, to=10, by=2)    # seq(1, 10, 2) 로 사용할 수 있음
seq(0, 1, 0.1)
seq(0, 1, length.out=5)     # np.linespace(0, 1, 11)

rep(c(1:3), times=2)        # 1 2 3 1 2 3
rep(c(1:3), each=2)         # 1 1 2 2 3 3

### Sorting
fruits <- c('banana', 'apple', 'cherry', 'mango', 'lemon')
numbers <- c(13, 3, 5, 7, 20, 2)
sort(fruits)    # 문자열 오름차순
sort(numbers)
numbers         # sort() 함수는 자기 파괴적이지 않음

### Indexing
fruits[1]       # 첫번째 요소, banana
fruits[-1]      # 첫번째 요소를 제외한 나머지 "apple"  "cherry" "mango"  "lemon"
fruits[-3]      # 세번째 요소를 제외한 나머지 "banana" "apple"  "mango"  "lemon"

### Slicing
fruits[2:4]     # "apple"  "cherry" "mango"

### 임의 선택
fruits[c(1, 4, 5)]  # "banana" "mango"  "lemon"

### 값 변경
fruits[1] = 'pear'



##### List
numbers = list(1, 2, 3L, 4+1i)  # 요소의 데이터 타입이 달라도 됨
numbers[4]

### 요소의 갯수
length(fruits)
length(numbers)


##### Matrices
m1 = matrix(c(1:6), nrow=2, ncol=3)
m1
m2 = matrix(c(1:6), nrow=3, ncol=2)
m2

### Indexing
m1[1, 2]        # 3
m2[3, 1]        # 3

thismatrix <- matrix(c("apple", "banana", "cherry", "orange","grape", "pineapple", "pear", "melon", "fig"), nrow = 3, ncol = 3)
thismatrix

thismatrix[c(1, 2), ]           # 첫번째, 두번째 행
thismatrix[, c(2, 3)]           # 두번째, 세번째 열
thismatrix[c(1, 2), c(2, 3)]    # 행, 열

# bind
m1
v1 = c(10, 20, 30)
m1 = rbind(m1, v1)              # 행을 붙임
m1
m1 = cbind(m1, c(100, 200, 300))# 열을 붙임
m1

# contains
fruits
'apple' %in% fruits

# 크기
dim(thismatrix)     # 3 3
length(thismatrix)  # 9 

# matrix와 반복문
m3 = matrix(c(1:12), nrow=3, ncol=4)
m3

for (row in 1:nrow(m3)) {
    for (col in 1:ncol(m3)) {
        print(m3[row, col])
    }
}

# 행렬 곱
m1 = matrix(c(1:6), nrow=2, ncol=3) # 2 X 3
m1
m2 = matrix(c(1:6), nrow=3, ncol=2) # 3 x 2
m2

m1 %*% m2   # 2 X 2

# 전치 행렬(transpose)
t(m1)
