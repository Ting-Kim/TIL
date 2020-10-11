# (Data Structure) Linked List (연결리스트)

### DataStructure의 대상은 MEMORY..!<br>( MEMORY의 효율적 사용 )<br>

#### STORAGE

용량이 크고 가격이 저렴하다.
전원을 꺼도 데이터가 저장된다는 특징.

#### MEMORY

용량이 적고 가격이 비싸다.
전원을 끄면 데이터가 사라진다는 특징.
STORAGE 보다 훨씬 빠른 속도로 데이터를 저장하고 처리.

#### CPU

STORAGE에서 데이터를 직접 가져오려면 STORAGE에서의 반응속도가 굉장히 느림.
그래서 메모리에서 STORAGE에 저장되어 있던 데이터를 옮겨오고, CPU가 읽어서 처리하는 방식으로 운영됨.

#### RAM(Random Access Memory)

각 데이터에 대한 주소를 알고 있다면 굉장히 빠른 속도로 가져올 수 있다.

#### LinkedList VS ArrayList

- ArrayList는 데이터가 다닥다닥 붙어있는 반면에,<br>(배열 개념을 사용) <br>LinkedList는 데이터가 떨어져있으며 서로 연결되어 있음.<br>(배열 X, 점조직 개념으로 노드끼리 참조)
- ArrayList는 데이터를 삭제하면 뒤의 데이터들을 한칸씩 옮겨줘야 한다. <br> LinkedList는 연결 Node만 바꿔주면 된다.
- ArrayList는 index 계산을 통해서 어떤 값을 가져올 경우, 가장 빠른 처리속도를 보여준다.
