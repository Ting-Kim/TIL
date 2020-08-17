# root-context.xml VS servlet-context.xml

### root-context.xml

- jsp와 관련 없는 bean 설정함 ( Service, repository )
- 비지니스 로직을 위한 설정

### servlet-context.xml

- jsp와 관련된 bean 설정 (controller, MultipartResolver(파일 업로드), Interceptor(로그인) 등)
- URI 관련 설정을 담는 클래스는 이 xml에 넣어야 함.
- WEB Application에서 Client의 요청을 받기 위한 설정

<img src="https://docs.spring.io/spring/docs/current/spring-framework-reference/images/mvc-context-hierarchy.png"/>
