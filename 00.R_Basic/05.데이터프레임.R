##### Data Frame
name = c('James', 'Maria', 'Brian')
age = c(22, 20, 25)
gender = factor(c('M', 'F', 'M'))       # 범주형 데이터
blood = factor(c('A', 'O', 'AB'), levels=c('A', 'B', 'O', 'AB'))

patients = data.frame(name, age, gender, blood)
patients

# 열 선택 및 타입 확인
patients$name
typeof(patients$name)
typeof(patients$blood)
colnames(patients)      # 열의 이름
rownames(patients)      # 행의 이름

# 행, 열을 인덱싱으로 선택할 수도 있음
patients[, 1]   # patients$name
patients[1, ]

# 하나의 값을 인덱싱 - 마리아의 나이
patients$age[2]
patients[2, 2]

# Filtering
patients[patients$gender == 'F', ]  # 여성 환자
patients[patients$blood == 'A', ]   # 혈액형이 A형인 환자

# Selection
patients[, c('age', 'gender', 'blood')] # 이름을 제외한 환자 정보
patients[, c(2:4)]

# Filtering and Selection
patients[patients$gender == 'M', c('age', 'gender', 'blood')]
patients[c(1, 3), c(2:4)]

# 레코드 추가(행 추가)
length(patients)            # 열의 갯수
length(patients$name)       # 행의 갯수
patients[length(patients$name)+1, ] = c('Emma', 24, 'F', 'B')
patients


# 컬럼 추가
patients['country'] = c('UK', 'US', 'AU', 'US')
patients

# 크기
dim(patients)


##### Factor
genre = factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"), levels = c("Classic", "Jazz", "Pop", "Rock", "Other"))
genre
levels(genre)
typeof(genre)


##### R dataset
head(cars)
tail(cars)
mean(cars$speed)
max(cars$dist)

tail(airquality)
mean(airquality$Ozone)

### 결측치(NA) 처리
# 1. 결측치 확인
str(airquality)
sum(is.na(airquality))              # 전체에서 결측치가 있는지 확인
for (i in 1:length(airquality)) {   # 컬럼별로 결측치가 있는지 확인
    print(sum(is.na(airquality[, i])))
}
colnames(airquality)
for (col in colnames(airquality)) {
    print(paste(col, sum(is.na(airquality[, col]))))
}

# 2. 결측치 대체 또는 제거
# Ozone 결측치를 평균으로 대체
mean(airquality$Ozone, na.rm=T)     # 결측치를 제외한 평균
airquality$Ozone = ifelse(is.na(airquality$Ozone),          # 조건
                          mean(airquality$Ozone, na.rm=T),  # 참일때의 값
                          airquality$Ozone)                 # 거짓일때의 값
sum(is.na(airquality$Ozone))

# Solar.R 결측치를 중앙값으로 대체
median(airquality$Solar.R, na.rm=T)
airquality$Solar.R = ifelse(is.na(airquality$Solar.R),
                            median(airquality$Solar.R, na.rm=T), 
                            airquality$Solar.R)
sum(is.na(airquality$Solar.R))


# 맨 마지막줄에 결측치 데이터를 추가한 후 제거
airquality[length(airquality$Ozone)+1, ] = c(NA, NA, NA, NA, NA, NA)
tail(airquality)
airquality = na.omit(airquality)
tail(airquality, 3)
