# R 변수
name <- 'James'
age = 25    # 할당 연산자로 <-, = 을 사용할 수 있음

name
print(age)
#print(name, age)           # Error, print()에서는 하나의 인자만 사용 가능
print(paste(name, age))     # [1] "James 25
print(paste0(name, age))    # [1] "James25"

# 변수명 - 단어와 단어 사이의 구분자로 . 을 주로 사용함
person.name <- 'Maria'
person.gender <- 'Female'
person.age <- 23

##### R 
# 1. numeric
x <- 10.5
class(x)

# 2. integer
y = 10L
class(y)

# 3. complex(복소수)
z = 9 + 3i
class(z)
print(z*z)
  

# 4. character(a.k.a string)
s = 'R is exciting'
class(s)

# 5. logical(a.k.a boolean: TRUE, FALSE, T, F)
class(T)


##### Type conversion
as.numeric(y)
as.numeric(TRUE)    # 1
as.character(F)     # "FALSE"


##### R Math
10 + 5
'10' + '5'          # string concatenation은 paste() 함수를 사용할 것

max(5, 10, 15)      # 15
min(1, 40, 30)      # 1
sqrt(16)            # 4
abs(-4.7)           # 4.7
ceiling(1.4)        # 2
floor(1.4)          # 1


##### Strings
str <- "Lorem ipsum dolor sit amet,
consectetur adipiscing elit,
sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua."      # multi-ling string

str                 # \n
cat(str)            # \n 대신에 출력에 줄바꿈이 들어감
length(str)         # 1
nchar(str)          # 123 - 문자의 갯수



##### 연산자(Operator)
# 1. 산술 연산자: +, -, *, /
2 ^ 5               # 32, exponent
5 %% 2              # 1, modulo
5 %/% 2             # 2, 몫

# 2. 비교 연산자: 파이썬과 동일

# 3. 논리 연산자: &, &&, |, ||, !
x > 10 && x < 20    # Logical AND, 10 < x < 20
person.age > 24 || age > 24     # Logical OR
!(nchar(s) > 5)     # Logical NOT 

c(F, F, T, T) & c(F, T, F, T)   # FALSE FALSE FALSE  TRUE
c(F, F, T, T) | c(F, T, F, T)   # FALSE  TRUE  TRUE  TRUE
