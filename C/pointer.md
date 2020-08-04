## 포인터(pointer) 개념

메모리의 주소를 저장하는 변수
다른 곳의 주소 그 자체를 가리키기 때문에 여러 응용이 가능함.
프로그램이 어떠한 위치에서 시행되더라도 특정한 주소를 그대로 이용하기 떄문에 값이 즉시 변경된다는 특징을 가지고 있음.
다른 변수가 위치한 공간 그 자체를 직접 접근하여 값을 바꾸거나 여러 처리가 가능하기 때문에 강력한 기능이라고 할 수 있다.

```
// 포인터 작성 예시
int *y = &x;    // x의 주소를 y 값에 할당
                // &는 주소값을 의미
```

```
#include <stdio.h>

// 두 변수의 값을 서로 변환하는 포인터 함수
void swap(int *x, int *y)
{
    int temp;
    temp = *x;
    *x = *y;
    *y = temp;
}

int main(void)
{
    int x = 1;
    int y = 2;
    swap(&x, &y);
    printf("x = %d\ny = %d\n", x, y);
    return 0;
}
```

```
실행결과
x = 2
y = 1       // 값이 바뀌었다.
```

```
#include <stdio.h>

// 포인터를 제거하면 함수 내에서만 값이 계산되며 메인 함수에는 영향을 미치지 못함.
void swap(int x, int y)
{
    int temp;
    temp = x;
    x = y;
    y = temp;
}

int main(void)
{
    int x = 1;
    int y = 2;
    swap(x, y);
    printf("x = %d\ny = %d\n", x, y);
    return 0;
}
```

```
실행결과
x = 1
y = 2       // 값이 변하지 않았다.
```

```
#include <stdio.h>

int main(void)
{
    int i = 10;
    int *p;
    p = &i;
    printf("i = %d\n", i);
    *p = 20;
    printf("i = %d\n", i);
    return 0;
}
```

```
실행결과
i = 10
i = 20
```
