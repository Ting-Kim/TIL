## 2차원 배열 입력

### list(리스트) vs tuple(튜플)

\* 참조
\- https://edykim.com/ko/post/python-list-vs.-tuple/

### 빠르게 입력 받기

```
import sys

# 문자열 입력 받기
data =  sys.stdin.readline().rstrip()

```

\* 파이썬 다양한 입력방법 (input(), realine())
\- https://velog.io/@tbnsok40/%ED%8C%8C%EC%9D%B4%EC%8D%AC-%EB%8B%A4%EC%96%91%ED%95%9C-%EC%9E%85%EB%A0%A5%EB%B0%A9%EB%B2%95-input-read-readline

###

```
# Python: print() - 기본적으로 띄어쓰기
print(8, end = ' ')
print(10)

# a = 7
print( "정답은 " + str(7) + "입니다")
# 같은 자료형이어야 출력됨.

```

### in / not in

```
data = 7
dataList = [1,2,3,7]

print(data in dataList)

# result : true ?


```

### 파이썬은 여러개의 반환 값을 가질 수 있다.

```
def operator(a,b)
    return a+b, a-b, a*b, a/b

a,b,c,d =operator(3,7)
```

### 람다 표현식

특징 : 함수를 한 줄에 작성할 수 있다

```
# a,b를 받아서 a+b를 반환하는 함수
print((lambda a, b: a + b))


```

```
# sum()

# min(), max()

# eval() : (유용함)
result = eval("(3+7+4)*3")
print(result)

# 실행결과 : 42

# sorted()

# sorted with key



```

순열 - permutations 라이브러리 이용..

```
from itertools import permutations

```

조합 - combinations 라이브러리 이용..

product 라이브러리

```
result = list(product(data, repeat = 2)) # 2개를 뽑는 모든 순열 구하기(중복 허용)
```

combinations_with_replacement 라이브러리

```
result = list(combinations_with_replacement(data, 2)) # 2개를 뽑는 모든 조합 구하기(중복 허용)
```

### 라이브러리

- itertools
  반복되는 데이터 처리 기능

- heapq
  graph 쪽 알고리즘에 사용

- bisect
  이진 탐색 기능

- collections
  덱(deque), 카운터(counter)

## 다차원 정렬방법

```
list = [
  [1, 65]
  [5, 23]
  [2, 99]
]

list.sort(key=lambda x:x[1])
print(list)

'''
실행결과
[[5, 23], [1, 65], [2, 99]]
'''

```
