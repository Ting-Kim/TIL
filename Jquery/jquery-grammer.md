# Jquery 문법 정리

Jquery 문법을 처음부터 끝까지 정리한다기 보다는, 공부하면서 그때그때 모르는 개념을 찾아보며 알게 된 내용을 정리하고자 한다. 😅

Jquery와 JavaScript 간 사용되는 문법이 조금씩 다르기에 유의해야 한다.
어떤 사이트 클로닝 프로젝트를 진행하고 있는데, 사이트 소스를 긁어와도 간단한 Jquery, JavaScript 구현 조차 쉽지 않았다. 2020.07.27 기준 플젝 후반부에 있는데, 8월 초까지는 이걸 수행하다가 모르는 점이 대부분이지 않을까 싶다.

---

### ㅇ jsp에서 어떤 태그의 Class에 문구를 추가하거나 제거하는 경우 (class="on" / class="")

#### - 사용하는 이유는 class에 자신이 지정한 문구를 추가하고 제거함으로서 css를 적용/해제하는데 사용함.

#### - Jquery에서 태그들의 부모, 자식, 형제 선택 방법

- 상위요소<br>
  선택 요소의 부모 요소 선택은 => .parent() <br>
  선택 요소의 상위 요소 모두 선택은 => .parents() <br>
  선택 요소의 상위 요소 중 지정한 선택자에 해당하는 요소 바로 이전까지의 요소를 모두 선택할 때는<br>
  => .parentsUntil()<br><br>
  선택 요소를 포함한 상위 요소 중 지정한 선택자에 해당하는 요소 중 첫 번째 요소 선택은<br>
  => .closest() 을 사용한다.

* 하위요소<br>
  선택 요소의 자식 요소를 모두 선택할 때는 => .children()<br>
  선택 요소의 하위 요소 중 지정한 선택자에 해당하는 모든 요소 선택은<br>
  => .find()

* 형제요소<br>
  선택 요소의 형제 요소 중 지정한 선택자에 해당하는 모든 요소 선택<br>
  => .siblings()<br>
  선택 요소 바로 다음 위치의 형제 요소 선택은<br>
  => .next()<br>
  선택 요소 바로 이전 위치의 형제 요소 선택은<br>
  => .prev()<br>

```
<!--  예시 코드 -->
<div class="date-area">
	<div class="wrap"
		style="position: relative; width: 2100px; border: none; left: -70px;">
    <!-- <c: 형식으로 작성된 부분은 JSTL 문법이다./> -->
    <c:forEach items="${calendarList}" var="dto" varStatus="status">
        <button class='<c:if test="${dto.weekday eq '토'}">sat</c:if>       <!-- ⓐ -->
                        <c:if test="${dto.weekday eq '일'}">holi</c:if>
                        <c:if test="${status.index eq 1}">  on</c:if>'
                type="button" date-data="${dto.calendar}"
                month="${fn:substring(dto.calendar, 6, 7)-1}"
                tabindex="<c:if test='${status.first || status.end}'>-1</c:if>"

                <!-- onclick 이벤트에 함수(this)를 줘서 script 태그에 작성한 함수 호출 -->
                onclick="btn_onOff(this)">                              <!-- ⓑ -->

        <span class="ir">${fn:substring(dto.calendar, 0, 4)}년 ${fn:substring(dto.calendar, 6, 7)}월</span>
        <em	style="pointer-events: none;">${fn:substring(dto.calendar, 8,10)}
        <span style="pointer-events: none;" class="ir">일</span>
        </em>
        <span class="day-kr" style="pointer-events: none; display: inline-block">
    </forEach>
    </div>
</div>

<script>
// 여기서 class에 'on' 추가 및 삭제
	function btn_onOff(obj){                    //   ⓒ
		$('.wrap').children('.on').removeClass('on');
		$(obj).addClass('on');
	}
</script>
```

c번을 보면, class를 지울 때는

> \$(선택자).removeClass('지우고자 하는 문구');<br>

class를 추가할 때는

> \$(선택자).addClass('추가하고자 하는 문구');<br>

이렇게 사용한다.
