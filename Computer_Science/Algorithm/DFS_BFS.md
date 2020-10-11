# DFS/BFS

### Stack

### Queue

```
from collections import deque
# deque의 경우는 연결리스트로 구현이 되어있어서 pop 동작이 빠르다
# 일반적인 list의 경우는 ArrayList로 구현이 되어있어서 내부적으로 좀 느린 경향이 있음.

queue = deque()

queue.append(5)
queue.append(1)
queue.append(3)
queue.append(7)
queue.popleft()
queue.append(1)
queue.append(4)
queue.popleft()

print(queue)
queue.reverse()
print(queue)

# 실행결과
# deque([5, 5, 1, 4])
# deque([4, 1, 5, 5])
```

### 재귀 함수(Recursive Function)

```
def recursive_function(i):
    # 종료조건을 꼭 명시해야함.
    if i == 100:
        return
    print(i, '번째 재귀함수에서', i+1, '번째 재귀함수를 호출합니다.')
    recursive_function(i+1)
    print(i, '번째 재귀 함수를 종료합니다.')

recursive_function(1)
```

## DFS(Depth-First Search), 깊이 우선 탐색

DFS는 스택 자료구조(혹은 재귀 함수)를 이용한다.
재귀와 반복을 모두 사용할 수 있는 경우에는 반복을 사용할 것.
(재귀는 Stack 영역에 쌓이기 때문)

\* python sys라이브러리를 이용하면 입력값을 받는 시간을 줄일 수 있다(?)

```

def dfs(graph, v, visited):
    # 현재 노드를 방문 처리
    visited[v] = True
    print(v, end = ' ')
    # 현재 노드와 연결된 다른 노드를 재귀적으로 방문
    for i in graph[v]:
        if not visited[i]:
            dfs(graph, i, visited)

# 각 노드가 연결된 정보를 표현 (2차원 리스트)
graph = [
    [],
    [2,3,8],
    [1,7],
    [1,4,5],
    [3,5],
    [3,4],
    [7],
    [2,6,8],
    [1,7]
]

# 각 노드가 방문된 정보를 표현 (1차원 리스트)
visited = [False] * 9

# 정의된 DFS 함수 호출
dfs(graph, 1, visited)


```

## BFS(Breadth-First Search), 너비 우선 탐색

큐 자료구조 이용, 가장 가까운 노드부터 차례대로 그래프 모든 노드 탐색..

```
from collections import deque

# BFS 메서드 정의
def bfs(graph, start, visited):
    # 큐(Queue) 구현을 위해 deque 라이브러리 사용
    queue = deque([start])
    # 현재 노드를 방문 처리
    visited[start] = True

    # 큐가 빌 때까지 반복.
    while queue:
        v = queue.popleft()
        print(v, end = ' ')
        # 아직 방문하지 않은 인접한 원소들을 큐에 삽입
        for i in graph[v]:
            if not visited[i]:
                queue.append(i)
                bfs(graph, i, visited)

# 각 노드가 연결된 정보를 표현 (2차원 리스트)
graph = [
    [],
    [2,3,8],
    [1,7],
    [1,4,5],
    [3,5],
    [3,4],
    [7],
    [2,6,8],
    [1,7]
]

# 각 노드가 방문된 정보를 표현 (1차원 리스트)
visited = [False] * 9

# 정의된 DFS 함수 호출
bfs(graph, 1, visited)

```

```
# <문제> 음료수 얼려 먹기

# DFS로 특정 노드를 방문하고 연결된 모든 노드들도 방문
def dfs(x, y):
    # 주어진 범위를 벗어나는 경우에는 즉시 종료
    if x <= -1 or y <= -1 or x >= n or y >= m:
        return False

    # 현재 노드를 아직 방문하지 않았다면
    if graph[x][y] == 0:
        # 해당 노드 방문 처리
        graph[x][y] = 1
        # 상,하,좌,우 위치 모두 재귀적으로 호출
        dfs(x+1,y)
        dfs(x-1,y)
        dfs(x,y-1)
        dfs(x,y+1)
        return True
    return False

# N, M을 공백을 기준으로 구분하여 입력 받기
n , m = map(int, input().split())

# 2차원 리스트의 맵 정보 입력 받기
graph = []
for i in range(n):
    graph.append(list(map(int, input())))

# 모든 노드(위치)에 대하여 음료수 채우기
result = 0
for i in range(n):
    for j in range(m):
        # 현재 위치에서 DFS 수행
        if dfs(i,j) == True:
            result += 1

print(result)

# 입력값
'''
4 5
00110
00011
11111
00000
'''
# 실행결과
'''
3
'''


```

```
# <문제> 미로 탈출 : 답안 예시(Python)

# BFS 소스코드 구현
def bfs(x,y):
    # 큐(Queue) 구현을 위해 deque 라이브러리 사용
    queue = deque()
    queue.append((x,y))

    # 큐(Queue)가 빌 때까지 실행
    while queue:
        x,y = queue.popleft()

        # 현재 위치에서 4가지 방향으로의 위치 확인
        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]

            # 미로 찾기 공간을 벗어난 경우 무시
            if nx < 0 or nx >= n or ny < 0 or ny >= m:
                continue

            # 벽인 경우 무시
            if graph[nx][ny] == 0:
                continue

            # 해당 노드를 처음 방문하는 경우에만 최단 거리 기록
            if graph[nx][ny] == 1:
                graph[nx][ny] = graph[x][y] + 1

                queue.append((nx,ny))

    # 가장 오른쪽 아래까지의 최단 거리 반환
    return graph[n-1][m-1]

from collections import deque

# N, M을 공백을 기준으로 구분하여 입력 받기
n, m = map(int, input().split())

# 2차원 리스트의 맵 정보 입력 받기
graph = []
for i in range(n):
    graph.append(list(map(int,input())))

# 이동할 네 가지 방향 정의
dx = [-1,1,0,0]
dy = [0,0,-1,1]

# BFS 수행 결과 출력
print(bfs(0,0))
```
