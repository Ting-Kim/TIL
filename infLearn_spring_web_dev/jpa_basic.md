## JPA 소개

현재 데이터베이스 세계는 관계형 DB(RDBMS)가 잡고 있다.

DB는 SQL문 밖에 못 알아들으므로 개발의 중심이 SQL이 되어버림.<br>
(SQL 의존적인 개발을 피하기 어려움)

객체 지향 프로그래밍 - 추상화, 캡슐화, 정보은닉, 상속, 다형성 등 시스템의 복잡성을 제어할 수 있는 다양한 장치들 제공

Java에서는 상속관계를 객체지향의 다형성 등을 이용해서 편리하게 이용할 수 있는데,

```
Album album = list.get(albumId);

//부모 타입으로 조회 후 다형성 활용
Item item = list.get(albumId);
```

SQL의 Table 슈퍼타입 서브타입 관계에서는 그게 안된다. (두 테이블에 모두 insert, 조회할 때는 join 등..)

객체는 연관관계에서 한방향으로 밖에 참조를 못한다.<br>
그에 반해 테이블은 양방향 가능. (PK, FK 간 조인)

```
String memberId = "100";
Member member1 = memberDAO.getMember(memberId);
Member member2 = memberDAO.getMember(memberId);
member1 == member2; //다르다.
class MemberDAO {
public Member getMember(String memberId) {
    String sql = "SELECT * FROM MEMBER WHERE MEMBER_ID = ?";
    ...
    //JDBC API, SQL 실행
    return new Member(...);
    }
}

// 자바 컬렉션에서는..
String memberId = "100";
Member member1 = list.get(memberId);
Member member2 = list.get(memberId);
member1 == member2; //같다.

```

객체를 자바 컬렉션에 저장하듯이 DB에 저장할 수 없을까 ? <br>
=> 그에 대한 해답이 'JPA(Java Persistence API, 자바 진영의 ORM 기술 표준)'이다.
