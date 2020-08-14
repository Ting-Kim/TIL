## 쌍용 - Spring 수업 내용

### Spring-tiles

## 20200812 수

[STSSecurity 프로젝트]
key: 접근 주체(Principal) 인증(Authenticate) 인가(Authorize) UI처리

- pring security는 filter 기반으로 동작하기 때문에 spring MVC 와 분리되어 관리 및 동작한다.

인증 - 로그인, 로그아웃
권한 - 사용자, 관리자 권한
예 ) 권한, 인증에 관한 정책 정할자

- notice.jsp : 로그인 없이 모든 사용자가 접근 가능
- noticeDetail.jsp: 로그인한 사용자만 접근 가능
- noticeEdit, noticeReg: 관리자로 로그인 해야만 접근(사용) 가능
