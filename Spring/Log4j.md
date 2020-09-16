# Log4j(Log for Java)

## 구조
### Logger(Category)
- 로깅 메세지를 Appender에 전달
- log4J의 심장부에 위치
- 개발자가 직접 로그출력 여부를 런타임에 조정
- logger는 로그레벨을 가지고 있으며, 로그의 출력 여부는 로그문의 레벨과 로거의 레벨을 가지고 결정


### Appender
- 로그의 출력위치를 결정(파일, 콘솔, DB 등)
- log4J API문서의 XXXAppender로 끝나는 클래스들의 이름을 보면, 출력위치를 어느정도 짐작가능

### Layout
-  Appender가 어디에 출력할 것인지 결정했다면 어떤 형식으로 출력할 것이지 출력 layout을 결정
