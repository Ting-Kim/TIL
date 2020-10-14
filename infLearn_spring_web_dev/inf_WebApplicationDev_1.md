## 실전! 스프링 부트와 JPA 활용1 - 웹 애플리케이션 개발 (from 김영한 現 배달의민족 개발팀장)

### 개발환경 설정

dependencies(Spring Starter)

- Spring Web
- Thymeleaf
- Spring Data JPA
- H2 Database
- Lombok

#### View template

대표적으로<br>
JSP의 단점은 브라우저에서 바로 안열림..
Thymeleaf의 단점은. . 태그를 정확히 다 닫아주지 않으면 에러가 났다. (3.0에서는 개선됨)
큰 장점은 Spring이랑 integration..

\* Spring.io 공식 guide 문서 참고를 많이 하는걸 추천..!

html 파일만 수정했을 경우 전체 서버 재시작은 오래걸리니까, 해당 html만 recompile 했을 때 수정사항이 적용되게 하는 방법은 build.gradle 파일에 implementation을 추가하는 것.<br>
= implementation 'org.springframework.boot:spring-boot-devtools'

### 도메인 분석 설계

<br>

## 변경 감지와 병합(merge)

<span style="color:pink; font-size:18px"> \* 정말 중요하다!</span>

준영속 엔티티
