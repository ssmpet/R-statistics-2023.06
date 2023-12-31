# 1. 어느 회사에서 종업원들의 근무기간을 조사하였는데, 종업원들의 근무기간은
# 평균이 11년이고 표준편차가 4년인 정규분포를 따른다고 한다.
# 그럼 이 회사에서 14년 이상 근무한 종업원의 비율을 구하시오.
# z = (X-u)/시그마(표준편차)
# z = (14-11)/4

e1 = 11
s1 = 4
pnorm(14, e1, s1)
1- pnorm(14, e1, s1)


# 2. 어느 전구회사에서 생산하는 전구의 수명은 평균이 800일이고 표준편차가 30일인
# 정규분포를 따른다고 한다. 그럼 전구의 수명이 760일 이하일 확률을 구하시요.
# z = (760-800)/30
e2 = 800
s2 = 30
pnorm(760, e2, s2)


# 3. 어느 고등학교 3학년 학생들의 수학 성적은 평균이 70점이고 표준편차가 8점인
# 정규분포를 따른다고 한다. 그럼 점수가 80점 이상이고 90점 이하일 확률을 구하시오.
# (80-70)/8 <= X <= (90-70)/8
e3 = 70
s3 = 8
pnorm(90, e3, s3) - pnorm(80, e3, s3)
