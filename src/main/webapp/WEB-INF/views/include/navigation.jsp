<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
    
    <!-- Topbar Start -->

<%
   //request.getAttribute : 이전 다른 jsp나 servlet에서 설정된 매개변수 값을 가져옴.
   if(com.icia.sweethome.util.CookieUtil.getCookie(request, 
                     (String)request.getAttribute("AUTH_COOKIE_NAME")) != null)
   {
%>
<style>
*{
font-family: 'Gothic A1', sans-serif;
}
</style>
<div class="container-fluid bg-dark p-0 wow fadeIn" data-wow-delay="0.1s">
    <div class="row gx-0 d-none d-lg-flex">
        <div class="col-lg-7 px-5 text-start">
            <div class="h-100 d-inline-flex align-items-center py-3 me-3">
                <a class="text-body px-2" href="tel:+0123456789"><i class="fa fa-phone-alt text-primary me-2"></i>010 6804 6814</a>
                <a class="text-body px-2" href="mailto:info@example.com"><i class="fa fa-envelope-open text-primary me-2"></i>sist@naver.com</a>
            </div>
        </div>
        <div class="col-lg-5 px-5 text-end">
            <div class="h-100 d-inline-flex align-items-center py-3 me-2">
                <a class="text-body px-2" href="/user/loginOut">로그아웃</a>
                <a class="text-body px-2" href="/user/userUpdate">회원정보수정</a>
            </div>
             <div class="h-100 d-inline-flex align-items-center">
                <a class="btn btn-sm-square btn-outline-body me-1" href=""><i class="fab fa-facebook-f"></i></a>
                <a class="btn btn-sm-square btn-outline-body me-1" href=""><i class="fab fa-twitter"></i></a>
                <a class="btn btn-sm-square btn-outline-body me-1" href=""><i class="fab fa-linkedin-in"></i></a>
                <a class="btn btn-sm-square btn-outline-body me-0" href=""><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>
</div>


<%
   }
   else
   {
%>

<div class="container-fluid bg-dark p-0 wow fadeIn" data-wow-delay="0.1s">
    <div class="row gx-0 d-none d-lg-flex">
        <div class="col-lg-7 px-5 text-start">
            <div class="h-100 d-inline-flex align-items-center py-3 me-3">
                <a class="text-body px-2" href="tel:+0123456789"><i class="fa fa-phone-alt text-primary me-2"></i>010 6804 6814</a>
                <a class="text-body px-2" href="mailto:info@example.com"><i class="fa fa-envelope-open text-primary me-2"></i>sist@naver.com</a>
            </div>
        </div>
        <div class="col-lg-5 px-5 text-end">
            <div class="h-100 d-inline-flex align-items-center py-3 me-2">
                <a class="text-body px-2" href="/user/loginPage">로그인</a>
                <a class="text-body px-2" href="/user/join">회원가입</a>
            </div>
            <div class="h-100 d-inline-flex align-items-center">
                <a class="btn btn-sm-square btn-outline-body me-1" href=""><i class="fab fa-facebook-f"></i></a>
                <a class="btn btn-sm-square btn-outline-body me-1" href=""><i class="fab fa-twitter"></i></a>
                <a class="btn btn-sm-square btn-outline-body me-1" href=""><i class="fab fa-linkedin-in"></i></a>
                <a class="btn btn-sm-square btn-outline-body me-0" href=""><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>
</div>
<%
   }
%>

<!-- Topbar End -->
    
    
    
  <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
  <a href="/index" class="navbar-brand ms-4 ms-lg-0">
       <h1 class="text-primary m-0"><img class="me-3" src="/resources/images/shop/logo1.jpg" alt="Icon"></h1>
  </a>
  <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
      <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarCollapse">
      <div class="navbar-nav ms-auto p-4 p-lg-0">
          <a href="/index" class="nav-item nav-link active">HOME</a>
          <div class="nav-item dropdown">
              <a href="/shop/shop" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">SHOP</a>
              <div class="dropdown-menu border-0 m-0">
              	<a href="/shop/shop" class="dropdown-item">쇼핑 메인</a>
                    <a href="/shop/product?shopTabCode=A" class="dropdown-item">가구</a>
                    <a href="/shop/product?shopTabCode=B" class="dropdown-item">가전</a>
                    <a href="/shop/product?shopTabCode=C" class="dropdown-item">잡화</a>
              </div>
            </div>
            <a href="/shop/bestItem" class="nav-item nav-link active">BEST ITEM</a>
            <div class="nav-item dropdown">
                <a href="/community/blog" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">COMMUNITY</a>
                <div class="dropdown-menu border-0 m-0">
                	<a href="/community/blog" class="dropdown-item">커뮤니티 메인</a>
                    <a href="/community/myroom" class="dropdown-item">마이룸 커뮤니티</a>
                    <a href="/community/ask" class="dropdown-item">질문게시판</a>
                    <a href="/community/free" class="dropdown-item">자유게시판</a>
                </div>
            </div>
            <div class="nav-item dropdown">
                <a href="/cs/csmain" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">고객센터</a>
                <div class="dropdown-menu border-0 m-0">
                	<a href="/cs/csmain" class="dropdown-item">고객센터 메인</a>
                    <a href="/cs/announce" class="dropdown-item">공지사항</a>
                    <a href="/cs/customerservice" class="dropdown-item">고객문의</a>
                </div>
            </div>
        </div>
    </div>


<%
   //request.getAttribute : 이전 다른 jsp나 servlet에서 설정된 매개변수 값을 가져옴.
   if(com.icia.sweethome.util.CookieUtil.getCookie(request, (String)request.getAttribute("AUTH_COOKIE_NAME")) != null)
   {
%>
<div id="mySidebar" class="sidebar">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="text-center">
  <h1 class="text-primary m-0"><img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle"><br>SISTUSER</h1>
  </div>
  <a href="/user/mypage">마이페이지</a>
  <a href="/user/order_list">내 주문내역</a>
  <a href="/user/order_list">내 배송상태</a>
  <a href="/user/order_list">내 문의내역</a>
  <a href="/user/order_list">마이룸 3D</a>
  <a href="/user/order_list">미정미정</a>
  <a href="/user/order_list">미정미정</a>
  <a href="/user/order_list">미정미정</a>
  <br>
  <hr>
  <a href="/user/mypage">회원정보수정</a>
  <a href="/user/order_list">로그아웃</a>
  <a href="/user/order_list">회원탈퇴</a><br>
  <a class="text-body px-2" href="tel:+0123456789">㈜ SWEETHOME<br><i class="fa fa-phone-alt text-primary me-2"></i>010 1234 1234</a>
</div>

<div id="main">
  <button class="openbtn" onclick="openNav()">&#9776; MENU</button>
</div>

<%
   }
   else
   {
%>
<div id="mySidebar" class="sidebar">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a>로그인 후 <br>이용 가능합니다.</a>
</div>

<div id="main">
  <button class="openbtn" onclick="openNav()">&#9776; MENU</button>
</div>
<%
   }
%>
</nav>