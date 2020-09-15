라이브러리 추가

- Spring Web
- Spring Boot DevTools
- Lombok

### TDD(Test Driven Development)

테스트 주도 개발, 목표 주도 개발, 사용자 중심 개발, 인터페이스 중심 개발

사용하는 이유 : 올바르게 작동, 깔끔한 코드

"Test Code First"

Red<br>
Green<br>
Refactoring<br> \* Refactoring : 작동하는 건 냅두고, 내부 코드만 바꾸는 기법

### Rest API(Representational State Transfer)

여러개의 프론트엔드를 하나의 백엔드로 여러 환경을 지원..
Resource 처리 (CRUD, Create, Get, Update(Put/Patch), Delete)

URI
URL

#### Collection

Read(List), Create

#### Member

Read(Detail), Update, Delete

#### JSON(JavaScript Object Notation)

#### APIs

가게 목록 - GET/restaurants
가게 상세 - GET/restaurants/{id}
가게 추가 - POST/restaurants

- 작동 - Controller
- Controller가 사용할 Application Layer = Service
- Service가 데이터를 관리하게 될 Repository

가게 수정 - PATCH/restaurants/{id}
가게 삭제 - DELETE/restaurants/{id}

<br>
~ 패스트캠퍼스 강의 15. 15. 가게 추가 2
