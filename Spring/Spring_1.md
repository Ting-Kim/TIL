# 스프링(Spring Framwork) 개념

## 주요개념

- bean(빈)
- AOP(Aspect Oriented Programming)
- 프록시(proxy)
- Spring을 이용한 MVC 패턴
- DI(Dependency Injection)
- Transaction(트랜잭션)
- Servlet Filter
- IoC(Inversion Of Control) 컨테이너 : 부품 혹은 조립된 부품들이 담긴 컨테이너

#### bean 태그

```
<!-- xml 파일 (지시서) -->
<bean id="객체명" class="객체화할 클래스명(패키지명 포함)" />

<!-- Setter 사용 -->
<bean id="exam" class="spring.di.entity.NewlecExam">
	<property name="kor">
		<value>10</value>		<!-- value를 이렇게 줄 수도 있음. -->
	</property>
	<property name="eng" value="10" />
	<property name="mat" value="10" />
	<property name="com" value="10" />
</bean>

<!-- ex. ExamConsole console = new GridExamConsole(); -->
<bean id="console" class="spring.di.ui.InlineExamConsole">

	<property name="(Setter 함수명에서 set을 생략)" value="객체의 이름(value 타입일 경우 - 특정 인자의 경우?)" ref="객체의 이름(ref 타입일 경우 - 객체의 경우?)"/>

<!-- console.setExam(exam); (Setter 함수 지시사항)-->
	<property name="exam" ref="exam"/>

</bean>
```

```
<!-- xml 파일 (지시서) -->
<bean id="객체명" class="객체화할 클래스명(패키지명 포함)" />

<!-- 생성자를 통해서 생성하는 경우 -->
<bean id="exam" class="spring.di.entity.NewlecExam">
	<!-- index 없어도 됨 -->
	<constructor-arg index="0" value="10" />
	<constructor-arg index="1" value="20" />
	<constructor-arg index="2" value="30" />

	<!-- name, type 속성도 사용 가능 -->
	<constructor-arg name="mat" type="int" value="40" />
</bean>
```

```
public class Program{

	public static void main(String[] args){

		ApplicationContext context = new ClassPathXmlApplicationContext("sprint/di/setting.xml");

		// bean 객체를 불러오는 두가지 방법
		//ExamConsole console = (ExamConsole)context.getBean("console");
		ExamConsole console = context.getBean(ExamConsole.class);
		console.print();
	}
}
```

#### DI(Dependency Injection)

```
// has-a 관계(일체형)
class A
{
	private B b;

	public A(){
		b = new B();
	}
}

// 조립형
class A
{
	private B b;

	public A(){

	}
	public void setB(B b){
		this.b = b;
	}
}
```

'부품 조립'

- Setter Injection : Setter 함수를 통해서 조립
- Contruction Injection : 생성자를 통해서 조립

##### ApplicationContext 종류

- ClassPathXmlApplicationContext
- FileSystemXmlApplicationContext
- XmlWebApplicationContext
- AnnotationConfigApplicationContext

#### AOP(Aspect Oriented Programming)

공통적인 기능은 특정 부분에만 필요한게 아니라, 어플리케이션 전반적인 부분에 필요한 부분.<br>
(공통기능과 핵심기능을 구분할 수 있어야 함)

- 권한을 요청하는 부분 -> 공통 기능(Crosscutting Concerns)<br>
  (로깅, 권한)

- write.do -> 비지니스 로직

#### 스프링 AOP 반드시 알아야 할 용어 5가지

- ㄱ. Aspect : 공통 관심사항(공통기능)을 모듈화한 것. 여러 비지니스 로직을 구현할 때 공통으로 사용되는 기능.
- ㄴ. Advice : 실질적으로 이루어지는 기능.
  ?)공통 기능을 핵심 기능에 언제 적용할지(시점).
- ㄷ. JointPoint : Advice를 적용할 수 있는 위치(지점). - 메서드 실행 시, 필드 변경 시 등..
- ㄹ. PointCut : Advice를 실제 적용한 지점.
  (PointCut에 사용되는 것이 AspectJ 문법)
- ㅁ. Weaving : 공통 기능을 핵심 기능인 비지니스 로직에 적용하는 것.

ArroundAdvice<br>- 보조 기능 클래스는 MethodInterCeptor 인터페이스를 구현<br>- app.LogPrintArroundAdvice 클래스 추가

##### 스프링은 프록시 기반의 AOP

- 사용 이유는 접근 제어 및 부가기능을 추가하기 위함.

---

20200804 Spring Days02

    	// BeforeAdvice
    	// 		핵심 관심 시행 ( core concern )이 처리되기 이전에 실행할 공통
    	// 		MethodBeforeAdvice를 구현
    	//		aop.LogPrintBeforeAdvice

    	// AfterAdvice						예외 발생여부 상관없이 처리되는 실행할 공통기능
    	// AfterReturningAdvice		핵심 기능이 예외없이 처리 되는 실행할 공통기능(예외 발생하면 실행 x)
    	//		-AfterReturningAdvice 인터페이스 구현
    	//		-aop.LogPrintAfterReturningAdvice
    	// AfterThrow~Advice			핵심 기능이 예외가 발생한 후 처리 되는 실행할 공통기능

// Before Advice 메서드 구현
// Joinpoint 인자는 실제 대상 객체(target)의 메서드 정보 또는
// 매개변수 값 등을 얻어올 수 있는 객체..
// 실제 대상 객체(target) - joinPoint.getTarget()
// 매개변수 값 - joinPoint.getArgs()
// 메서드 정보 - joinPoint.getSignature().getName()

pointCut 표현식 예시
<aop:before method="before" pointcut="execution(public _ aop.._(_,_))"/>
public => 접근제한자(스프링에선 보통 public, 생략 가능)

\*=> 모든 리턴 타입<br>
aop => 패키지명<br>
.. => aop 패키지 안의 모든 클래스(0개 이상) <br> \* => 모든 메서드 타입<br>
() => 파라미터 타입<br>
\*,\* 인자의 모든 타입

### context:component-scan 사용법

애노테이션(Annotation) 종류

- @Component
- @Service
- @Controller
- @Repository

위 넷은 스프링 2.5 버전 이상부터 사용가능한 streotype 애노테이션이다. 이들로 등록된 빈은 default로 스캔해준다.<br>
(default 애노테이션을 스캔하지 않는 방법도 있다. use-default-filters를 이용하면 된다. 기본값은 true이기 때문에 false로 선언해주면 디폴트 애노테이션들을 스캔하지 않는다.)

```
<context:component-scan base-package="패키지명" />
```

base-package : 패키지를 어디부터 스캔할지 지정해주는 부분<br>
(여러개도 지정 가능하다. ex. "newlecture.dao, controllers.customer")

### Spring MVC 패턴

구성요소

- DispatcherServlet : 모든 요청을 전달 받음. 클라이언트의 요청을 Controller에 전달 및 Controller의 리턴 결과값을 View에 전달.
- HandlerAdapter ( Spring Bean 객체 ) : DispatcherServlet 요청을 변환해서 Conroller에 전달
- Controller ( Spring Bean 객체 )
- HandlerMapping ( Spring Bean 객체 )
- ViewResolver ( Spring Bean 객체 )
- ModelAndView(컨트롤러 실행 결과를 담을 객체)

Spring에서의 Controller는 모델 객체를 말한다.
일반적인 Handler를 Controller라고 칭함.<br>
보통 작업이 많이 필요한 부분은 Controller, JSP 이다. (나머지는 프레임워크 내부에 구현되어 있음.)

##### front Controller / controller

Front Controller를 서블릿으로 등록할 때 XmlWebApplicationContext 스프링 컨테이너가 빈 객체 생성 및 조립을 하기 위해 dispatcher-servlet.xml(파일명 형식 : servletName-servlet.xml) 파일이 꼭 필요하다.

(\*View가 Spring에서는 꼭 JSP가 아닐 수 있다.)

ref)

- https://atoz-develop.tistory.com/entry/Spring-%EC%8A%A4%ED%94%84%EB%A7%81-XML-%EC%84%A4%EC%A0%95-%ED%8C%8C%EC%9D%BC-%EC%9E%91%EC%84%B1-%EB%B0%A9%EB%B2%95-%EC%A0%95%EB%A6%AC : [Spring] 스프링 XML 설정 파일 작성 방법 정리
- https://zorba91.tistory.com/249 : [Spring] context:component-scan 사용법 정리
- https://docs.spring.io/spring/docs/3.0.0.M4/reference/html/ch03s10.html : 스프링 공식문서(3.10 Classpath scanning and managed components)