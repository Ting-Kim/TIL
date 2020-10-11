# Map, HashMap에 대해

Map

- Red Black Tree 구조

HashMap

- Hash Table 구조

#### 해시 함수(Hash Function)?

데이터를 효율적으로 관리하기 위해 임의의 길이의 데이터를 고정된 길이의 데이터로 매핑하는 함수이다.

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Hash_table_5_0_1_1_1_1_1_LL.svg/675px-Hash_table_5_0_1_1_1_1_1_LL.svg.png" width="400px" height=""/>

### 충돌(Collision)

Hashing으로 계산된 인덱스가 겹치는 경우가 발생하는데, 이걸 충돌(Collision)이라고 한다. 이를 최소화하려면 좋은 해시 함수를 써야 하고, 발생했을 때는 해결을 해야한다.

- Separating Chaining - Linked List, Tree(Red-Black Tree)
  data 6개 이하의 경우 Linked List,
  data 8개 이상의 경우, tree를 사용
  7개의 경우는 데이터 삭제 시 Linked List로 바꿔야하고, 추가되면 Tree로 바꿔야한다. 이때 오버헤드가 있기 때문에 기준이 6,8인 것.
  Linked List를 사용할 때는 인덱스 충돌 발생 시, 인덱스가 가리키고 있는 Linked List에 Node를 추가해서 삽입.

* Open addressing - Linear Probing, Quadratic Probing, Double hashing
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Hash_table_5_0_1_1_1_1_0_SP.svg/570px-Hash_table_5_0_1_1_1_1_0_SP.svg.png" width="400px" height=""/>

#### Separating Chaining

ref)

- http://egloos.zum.com/sweeper/v/925740 [알고리즘] Hash Table
- https://hee96-story.tistory.com/48 [자료구조] Hash, HashTable, HashMap
