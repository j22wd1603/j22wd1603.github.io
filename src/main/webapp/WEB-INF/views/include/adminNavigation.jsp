<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <!-- Topbar Start -->
    

<%


   //request.getAttribute : 이전 다른 jsp나 servlet에서 설정된 매개변수 값을 가져옴.
   if(com.icia.sweethome.util.CookieUtil.getCookie(request,"ADMIN_ID") != null)
   {
	   
	   
%>

		<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
		  <a href="/index" class="navbar-brand ms-4 ms-lg-0">
		      <h1 class="text-primary m-0"><img class="me-3" src="/resources/img/icons/icon-1.png" alt="Icon">SWEETHOME</h1>
		  </a>
		  <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
		      <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarCollapse">
		      <div class="navbar-nav ms-auto p-4 p-lg-0">
		          <a href="/admin/adminIndex" class="nav-item nav-link active">HOME</a>
		          <a href="/admin/adminCommunity" class="nav-item nav-link active">커뮤니티 관리</a>
		          <a href="/admin/adminCs" class="nav-item nav-link active">고객센터 관리</a>
		          <a href="/admin/loginOut" class="nav-item nav-link active">로그아웃</a>
		        </div>
		    </div>
		
		</nav>
		
		
		



<%
   }
   else
   {
%>
		<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
		  <a href="/admin/adminIndex" class="navbar-brand ms-4 ms-lg-0">
		      <h1 class="text-primary m-0"><img class="me-3" src="/resources/img/icons/icon-1.png" alt="Icon">SWEETHOME</h1>
		  </a>
		  <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
		      <span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarCollapse">
		      <div class="navbar-nav ms-auto p-4 p-lg-0">
		          <a href="/admin/main" class="nav-item nav-link active">로그인</a>
		        </div>
		    </div>
		
		</nav>
<%
   }
%>


