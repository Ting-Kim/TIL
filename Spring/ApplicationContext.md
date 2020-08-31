# ApplicationContext (IOC Container)

IOC로 구현한 코드를 동작하게 만들어준다
<br>=> IOC 컨테이너 내부에서 클래스 객체를 만들어주고 (OwnerController) 이걸 Bean으로 불리는데 이러한 Bean들의 의존성을 관리해줌.
OwnerController
OwnerRepository 둘 모두 Bean이다. (Controller, Component, Repository 어노테이션은 Beam으로 등록됨.)

```
// 일반적인 의존성
@Controller
class OwnerController {
    private OwnerRepository repository = new OwnerRepository();
}

// IoC의 경우
@Controller
class OwnerController {
    private OwnerRepository repo;

    public OwnerController(OwnerRepository repo) {
        this.repo = repo;
    }
}

```

## Bean

@Bean을 통해서 Bean 객체로 등록하는 것은 @Configuration을 가지고 있는 클래스 안에서 정의를 해야한다.
(Annotation의 클래스를 타고 들어가면 @Configuration이 선언되어 있음.)

- 스프링 5버전 부터는 Bean(클래스) 내에 생성자가 1개이고, 매개변수 타입이 모두 Bean으로 존재할 경우, 자동으로 @AutoWired해준다.(Bean을 주입해준다)
- @Autowired는 생성자/필드/Setter에 붙일 수 있는데, 생성자에 붙이는걸 가장 추천하며(생성자 1개일 경우는 생략) Setter가 있는 경우는 Setter에, Field만 있는 경우는 굳이 Setter를 추가로 만들지 않고 Field에 붙인다.

## AOP

"흩어져 있는 코드를 한 곳으로 모으는 기법" (공통적으로 여기저기 들어감)

```
@Transactional(readOnlu = true)
```

트랜잭션(AutoCommit = false)<br>
비지니스로직 수행(try-catch-finally)<br>
(catch 문 문제 발생 시 트랜잭션 Rollback<br>
트랜잭션 Commit<br>
(Spring Data JPA가 제공하는 모든 메서드에는 기본적으로 @Transactional이 적용되어 있음)

## PSA(Portable Service Absraction)

"기반 기술이 달라져도 바꿔껴서 사용할 수 있는 추상화(?)"

Spring framework의 90%는 추상화(Abstraction)된 인터페이스이다.

PlatformTransactionManager를 구현한 구현체들 중 JpaTransactionManager가 기본적으로 spring-boot에서는 Bean으로 등록을 해놓는데, 이를 DataSourceTransactionManager로 사용한다면 같은 인터페이스를 구현하므로 내가 작성한 코드(Aspect 코드(?))들은 수정이 필요하지 않다.

## Spring Cache

Spring Annotation 사용하려면 CacheManager가 있어야 함.

## Web MVC

@GetMapping("/owners/new")
Annotation만으로는 Servlet을 쓰는지, Reactive를 쓰는지 알 수 없다. 따라서 추상화라고 볼 수 있다. (기술을 독립적으로 만들어줌)<br>
그래서 Reactive에서 지원하는 파라미터 등 코드들은 Reactive로 변환해서 사용할 수 있다.
