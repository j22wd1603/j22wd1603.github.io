<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<link href="/resources/css/csstyle.css" rel="stylesheet">


<script>
    function filterFAQ(category) {
        const faqItems = document.querySelectorAll('.faq-item');
        faqItems.forEach(item => {
            const itemCategory = item.getAttribute('data-category');
            if (category === '구분' || itemCategory === category) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
        });
    }
</script>
<style>
.yun1 li{
  background-color: white; /* 배경색을 흰색으로 설정 */	
}
</style>
</head>
<body>


<main>
  <h1>고객센터</h1>
  <div class="chat">
    <section>
      <div class="bigimg chat_img">
        <svg viewBox="0 0 56 44" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M2 2H33V8H35V2C35 0.895431 34.1046 0 33 0H2C0.895431 0 0 0.89543 0 2V22C0 23.1046 0.89543 24 2 24H5.5C5.77614 24 6 24.2239 6 24.5V29.8759V30.1985V31.2023V31.619C6 32.0866 6.58473 32.2983 6.88411 31.9391L7.15085 31.619L7.7935 30.8478L8 30.6L13.2002 24.3598C13.3901 24.1318 13.6716 24 13.9684 24H33C34.1046 24 35 23.1046 35 22V16H33V22H13.9684C13.078 22 12.2337 22.3955 11.6637 23.0794L8 27.4759V24.5C8 23.1193 6.88071 22 5.5 22H2V2Z" fill="black"/>
      <path fill-rule="evenodd" clip-rule="evenodd" d="M54 13H23V19H21V13C21 11.8954 21.8954 11 23 11H54C55.1046 11 56 11.8954 56 13V33C56 34.1046 55.1046 35 54 35H50.5C50.2239 35 50 35.2239 50 35.5V40.8759V41.1985V42.2023V42.619C50 43.0866 49.4153 43.2983 49.1159 42.9391L48.8491 42.619L48.2065 41.8478L48 41.6L42.7998 35.3598C42.6099 35.1318 42.3284 35 42.0316 35H23C21.8954 35 21 34.1046 21 33V27H23V33H42.0316C42.922 33 43.7663 33.3955 44.3363 34.0794L48 38.4759V35.5C48 34.1193 49.1193 33 50.5 33H54V13Z" fill="black"/>
  </svg>
      </div>

      <h2>1:1 문의</h2>
      <p>게시판에 남겨주시면 답변드리겠습니다.</p>
      <div class="chat_btn">
      
<%
   //request.getAttribute : 이전 다른 jsp나 servlet에서 설정된 매개변수 값을 가져옴.
   if(com.icia.sweethome.util.CookieUtil.getCookie(request, 
                     (String)request.getAttribute("AUTH_COOKIE_NAME")) != null)
   {
%>
        <a href="/cs/customerservice">1:1문의하러 가기<i class="fas fa-arrow-right"></i></a>
	<%
	
	}
   else
   {
	%>
	<a href="/user/loginPage">1:1문의하러 가기<i class="fas fa-arrow-right"></i></a>
	<%
	}
	%>
      </div>
    </section>
    <section>
      <div class="bigimg write_img">
        <svg viewBox="0 0 56 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M2 2H54V34H2L2 2ZM0 2C0 0.895431 0.895431 0 2 0H54C55.1046 0 56 0.895431 56 2V34C56 35.1046 55.1046 36 54 36H2C0.89543 36 0 35.1046 0 34V2ZM5.49206 5.62944C5.01126 5.35768 4.40119 5.52714 4.12944 6.00794C3.85768 6.48874 4.02714 7.09881 4.50794 7.37056L27.5079 20.3706L28 20.6487L28.4921 20.3706L51.4921 7.37056C51.9729 7.09881 52.1423 6.48874 51.8706 6.00794C51.5988 5.52714 50.9887 5.35768 50.5079 5.62944L28 18.3513L5.49206 5.62944Z" fill="black"/>
  </svg>
      </div>

      <h2>공지사항</h2>
      <p>공지사항을 확인해주세요.</p>
      <div class="chat_btn">
        <a href="/cs/announce">공지사항 바로가기<i class="fas fa-arrow-right"></i></a>

      </div>
    </section>
    <section>
      <div class="bigimg call">
        <svg viewBox="0 0 34 60" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M3 2H31C31.5523 2 32 2.44772 32 3V57C32 57.5523 31.5523 58 31 58H3C2.44772 58 2 57.5523 2 57V3C2 2.44772 2.44772 2 3 2ZM0 3C0 1.34315 1.34315 0 3 0H31C32.6569 0 34 1.34315 34 3V57C34 58.6569 32.6569 60 31 60H3C1.34315 60 0 58.6569 0 57V3ZM6 7C5.44772 7 5 7.44772 5 8C5 8.55229 5.44772 9 6 9H28C28.5523 9 29 8.55229 29 8C29 7.44772 28.5523 7 28 7H6ZM5 45C5 44.4477 5.44772 44 6 44H28C28.5523 44 29 44.4477 29 45C29 45.5523 28.5523 46 28 46H6C5.44772 46 5 45.5523 5 45ZM17 54C18.1046 54 19 53.1046 19 52C19 50.8954 18.1046 50 17 50C15.8954 50 15 50.8954 15 52C15 53.1046 15.8954 54 17 54Z" fill="black"/>
  </svg>
      </div>


      <h2>전화 문의</h2>
      <p>1588-2014</p>
      <div class="chat_btn">

      </div>
    </section>
  </div>
</main>
		 

	<article class="qus">
    <h1>FAQ</h1>
   
    <section>
        <ul class="yun1">
            <li><div class="form-inline">
                <select id="faqCategorySelect" onchange="filterFAQ(this.value)">
                    <option value="구분">구분</option>
                    <option value="배송">배송</option>
                    <option value="교환/취소">교환/취소</option>
                    <option value="주문/결제">주문/결제</option>
                    <option value="회원정보">회원정보</option>
                </select>
            </div></li>
            <li>제목</li>
        </ul>
    </section>

    <c:if test="${not empty list}">
        <c:forEach var="csmain" items="${list}" varStatus="loop">
            <div class="faq-item" data-category="${csmain.faqCategory}">
                <input type="checkbox" class="read-more-state" id="post-${loop.index}" />
                <label for="post-${loop.index}" class="ing read-more-trigger">
                    <ul>
                        <li>${csmain.faqCategory}</li>
                        <li>${csmain.faqTitle}</li>
                    </ul>
                </label>
                <section class="talk read-more-target">
                    <p>${csmain.faqContent}</p>
                </section>
            </div>
        </c:forEach>
    </c:if>
</article>
</body>
</html>