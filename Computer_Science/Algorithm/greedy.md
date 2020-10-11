## 그리디(Greedy) 알고리즘

거스름 돈의 문제인 경우, 큰 단위가 작은 단위의 배수이기 때문에 알고리즘이 성립하는것..

```
# n을 k로 나누거나 1을 빼서 1을 만드는 최소 경우의 수

n, k = map(int, input().split())

result = 0

while True:
    target = (n//k)*k
    result += (n-target)
    n = target

    if n < k:
        break

    result += 1
    n //= k

result += (n-1)
print(result)
```
