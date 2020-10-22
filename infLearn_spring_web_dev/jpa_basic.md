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

### Hello JPA

maven 프로젝트로 실습..

dependency

- hibernate 5.3.10
  내가 사용할 Spring 버젼 document를 참조해서 org.hibernate를 사용하는 버젼 확인..!

- com.h2database

javax.persistence:javax.persistence-api:2.2

하이버네이트가 jpa인터페이스를 가지고 있는것

JPA 설정 - persistence.xml

main/resource/META-INF/persistence.xml

hibernate.dialect
데이터베이스 방언 : 표준 SQL문법을 따르지 않는 특정 SQL 언어의 문법
JPA는 데이터베이스를 쓰다가 다른 데이터베이스로 바꾸는게 가능해야한다.

javax- 로 시작하는건
javax의 구현체로서 Hibernate, 등등 있는데 javax- 부분은 Hibernate 말고 다른 라이브러리로 바꿔도 안고쳐도 된다. Hibernate로 시작하는건 Hibernate에서만 사용 가능한 것

EntityManagerFactory
웹 서버가 올라오는 시점에 DB 당 하나만 생성이 됨
WAS가 내려갈 때 닫아줘야 함.

EntityManager
요청이 올 때마다 썼다가 close()를 반복(쓰레드 간에 절대 공유 X !!)

JPQL
객체를 대상으로 하는 객체지향SQL
(SQL은 데이터베이스 테이블을 대상으로 쿼리를 날림)
강점은 SQL방언에 맞게 날려줌. SQL 추상화로 특정 데이터베이스 SQL에 의존X

```
EntityMagagerFactory emf = Persistence.createEntityManagerFactory(“hello”);

EntityManager entityM anager = emf.createEntityManager();

EntityTransaction tx = em.getTransaction();
tx.begin();

try {
	/*

	Member member = new Member();

	member.setId(1L);
	member.setName(“helloA”);
	// JPA에서 모든 데이터 변경 작업은 TX내에서 이뤄져야 함.
	em.persist(member);
	*/

	Member findMember= em.find(Member.class, 1L);
	//System.out.println(“findMember.id” + findMember.getId());

	//System.out.println(“findMember.name” + findMember.getName());

	findMember.setName(“HelloJPA”);




	tx.commit();

} catch (Exception e) {
	tx.rollback();
} finally {
	em.close();
}

emf.close();
```

```

// JPQL 사용 예
(SQL 방언에 맞춰서 각 DB에 맞게 반영해줌)
List<Member> result = em.createQuery(“select m from Member as m”, Member.class).getResultList();

for (Member member : reuslt) {
	System.out.println(member.name = “ + member.getName());
}
```

```
package hellojpa;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
// @Table(name = “USER”)	// 실제 DB테이블 명이 다를 경우
public class Member {

    @Id // PK 임을 표기
    private Long id;

    //@Column(name = "username”)	// 실제 DB테이블 명이 다를 경우
    private String name;

    //Getter, Setter …
    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }
}

/*

create table Member {
	id bigint not null,
	name varchar(255),
	primary key (id)
}
*/
```

```
hibernate.show_sql
hibernate.format_sql
hibernate.use_sql_comments
<!— insert hellojpa.Member —>
```

### 영속성 컨텍스트 1

"엔티티를 영구 저장하는 환경" 이라는 뜻

// 객체를 생성한 상태 -> 비영속 상태

// 객체를 저장한 상태(영속)

어플리케이션 전체에서 공유하는 캐시는 JPA나 Hiberanate에선 2차캐시라고 함

1차 케이스는 데이터 베이스의 한 트랜잭션 안에서만 효과가 있기 때문에 전체적인 성능을 크게 높이진 않다.(그래도 비지니스 로직이 굉장히 복잡할 때는 도움이 된다.)

플러시 : 영속석 컨텍스트의 변경내용을 데이터 베이스에 반영

- 변경 감지
- 수정된 엔티티를 쓰기 지연 SQL 저장소에 등록
- 쓰기 지연 SQL 저장소의 쿼리를 데이터베이스에 전송

플러시 방법

- em.flush() : 직접 호출
- 트랜잭션 커밋 : 플러시 자동호출
- JPQL 쿼리 실행 - 플러시 자동호출

JPQL 쿼리 실행 시 플러시가 자동으로 호출 됨.

### 기본키 매핑
