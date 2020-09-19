## Spring 입문

gralde : 의존관계가 있는 라이브러리를 함께 다운로드
스프링부트 스타터 관련 라이브러리

- spring-boot-starter-web
- junit
- assert
- slf4j : logging 관련한 인터페이스(?)
- log4j : slf4j를 구현한(?) 라이브러리

- Spring-web-Devtools(?) : 서버 재시작 없이 컴파일 시켜주는 라이브러리(?)

객체를 JSON으로 변환해주는 대표적인 리이브러리 2가지

- Jackson
- GSON

테스트 코드를 먼저 만들고, 구현 클래스를 만드는 것이 TDD(테스트 주도 개발)이다..

Spring Bean(스프링 빈) 등록 방법 2가지

- Component Scan에 의한 자동 등록
- 자바 코드로 설정 파일(SpinrgConfig - @Configuration) 등록

DI(Dependency Injection) 3가지<br>
DI : 해당 클래스에서 Repository를 직접 생성하는게 아니라 외부에서 주입받는다

- 생성자 주입<br>
  : 가장 많이 사용하는 방법

- 필드 주입<br>
  : 생성자가 없고 필드에다가 @Autowired<br>
  필드 주입이 안 좋은 점은 스프링이 작동될 때 넣어주고 이후에 바꿔줄 방법이 없다.(필드에 대해서 추가하거나 수정을 못함)
- Setter 주입<br>
  Controller를 호출할 때 public으로 열려있어야 하는데, 세팅 이후엔 중간에 바꿀 이유가 없다.<br>
  그래서 public으로 인한 노출이 된다는 점과 이후에 잘못 변경될 여지가 있는 점이 단점..

스프링이 왜 좋냐면.. 객체지향 관점에서 프로그램이 동작하는데 필요한 기존 코드는 변경하지 않고 수정할 수가 있다. (인터페이스를 활용해서 구현체만 바꾸는 등..)

- 개방-폐쇄 원칙(OCP, Open-Closed Principle)<br>
- 스프링의 DI(Dependencies Injection)<br>
  : 설정만으로 구현 클래스 변경 가능
