<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<script src="https://kit.fontawesome.com/293152e236.js" crossorigin="anonymous"></script>

<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <%@ include file="/WEB-INF/views/include/navigation.jsp" %>
    
	<script type="text/javascript">
	
		function fn_view(commuIdk)
		{
			var userId = "${cookieUserId}";
			
			if(userId == "")
			{			
				alert("로그인이 필요합니다.");
				
				return;
			}
	
			document.bbsForm.commuIdk.value = commuIdk;
			document.bbsForm.action = "/community/view";
			document.bbsForm.submit();		
		}		
	
	</script>
    
    
    
</head>



<body>
   
   
    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown"><a class="text-white" href="/community/blog">Community</a></h1>
			
            <nav aria-label="breadcrumb animated slideInDown" >
                <ol class="breadcrumb text-uppercase mb-0" >
                    <li class="breadcrumb-item"><a class="text-white" href="/community/myroom">마이룸</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="/community/free">자유게시판</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="/community/ask">질문게시판</a></li>
                </ol>
            </nav>
            <button type="button" id="btnWrite" class="btn btn-secondary mb-3 mx-1" style="background-color: #a5a5a5; border:none; border-radius:7px;  position:relative; top: 20px;"><a href="/community/writeForm" style="color:white;"><i class="fa-solid fa-plus" style="color: #ffffff;"></i> 글쓰기</a></button>
        </div>
    </div>
    <!-- Page Header End -->


<!-- Team Start -->
<div class="container-xxl py-5">
  <div class="container">
    <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
      <h4 class="section-title">MyRoom</h4>
      <h1 class="display-5 mb-4"><a href="/community/myroom" style="color:black">마이룸 게시판</a></h1>
    </div>
    
    <div class="row g-0 team-items">
    
      <c:forEach var="commuBoard" items="${list1}" varStatus="status">
      	<c:if test="${commuBoard.commuStatus eq 'Y'}">	
	        <c:if test="${commuBoard.fileCheck eq 'Y'}">
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
           				<img  class="img-fluid" style="object-fit: cover; height:261px; border-radius:10px;" src="/resources/images/community/${commuBoard.commuIdk}.${commuBoard.fileExt}">
		              </div>
		              <div class="text-center p-4">
		                <h3 class="mt-2" style="overflow:hidden; white-space:nowrap; text-overflow: ellipsis;">${commuBoard.commuTitle}</h3>
						<div style="display: flex; align-items: center;">
						    <div class="box" style="background: #BDBDBD; width: 24px; height: 24px; border-radius: 70%; overflow: hidden; margin-right: 10px;">
						        <img class="profile" src="/resources/images/profile/${commuBoard.userId}.${commuBoard.imageFileExt}" style="width: 100%; height: 100%; object-fit: cover;" />
						    </div>
						    <div style="font-size: large; color: black;">${commuBoard.userId}</div>
						</div>
					    
		                <span style="float:left; color:black;"><img src="/resources/img/icons/eye.png"/> ${commuBoard.commuViews}&nbsp;</span>
          					<span style="float:left; color:black;"><img src="/resources/img/icons/small_heart.png" style="margin-bottom:4px;"/> ${commuBoard.commuLikes}</span>
		                <span style="color:black; float:right; font-weight: bold;"> ${commuBoard.regDate}</span>
		              </div>
	              	</a>
	            </div>
	          </div>
	        </c:if>		
	         
	        <c:if test="${commuBoard.fileCheck ne 'Y'}">
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
           				<img class="img-fluid" style="object-fit: cover; height:261px; border-radius:10px;" src="/resources/images/community/default.jpg">
		              </div>
		              <div class="text-center p-4">
		                <h3 class="mt-2" style="overflow:hidden; white-space:nowrap; text-overflow: ellipsis;">${commuBoard.commuTitle}</h3>
						<div style="display: flex; align-items: center;">
						    <div class="box" style="background: #BDBDBD; width: 24px; height: 24px; border-radius: 70%; overflow: hidden; margin-right: 10px;">
						        <img class="profile" src="/resources/images/profile/${commuBoard.userId}.${commuBoard.imageFileExt}" style="width: 100%; height: 100%; object-fit: cover;" />
						    </div>
						    <div style="font-size: large; color: black;">${commuBoard.userId}</div>
						</div>
					    
		                <span style="float:left; color:black;"><img src="/resources/img/icons/eye.png"/> ${commuBoard.commuViews}&nbsp;</span>
          					<span style="float:left; color:black;"><img src="/resources/img/icons/small_heart.png" style="margin-bottom:4px;"/> ${commuBoard.commuLikes}</span>
		                <span style="color:black; float:right; font-weight: bold;"> ${commuBoard.regDate}</span>
		              </div>
	              	</a>
	            </div>
	          </div>
	        </c:if>
        </c:if>
      </c:forEach>
    </div>
  </div>
</div>

<div class="container-xxl py-5">
  <div class="container">
    <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
      <h4 class="section-title">Free</h4>
      <h1 class="display-5 mb-4"><a href="/community/free" style="color:black">자유 게시판</a></h1>
    </div>


    <div class="row g-0 team-items">
      <c:forEach var="commuBoard" items="${list2}" varStatus="status">
      	<c:if test="${commuBoard.commuStatus eq 'Y'}">	
	        <c:if test="${commuBoard.fileCheck eq 'Y'}">
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
           				<img  class="img-fluid" style="object-fit: cover; height:261px; border-radius:10px;" src="/resources/images/community/${commuBoard.commuIdk}.${commuBoard.fileExt}">
		              </div>
		              <div class="text-center p-4">
		                <h3 class="mt-2" style="overflow:hidden; white-space:nowrap; text-overflow: ellipsis;">${commuBoard.commuTitle}</h3>
						<div style="display: flex; align-items: center;">
						    <div class="box" style="background: #BDBDBD; width: 24px; height: 24px; border-radius: 70%; overflow: hidden; margin-right: 10px;">
						        <img class="profile" src="/resources/images/profile/${commuBoard.userId}.${commuBoard.imageFileExt}" style="width: 100%; height: 100%; object-fit: cover;" />
						    </div>
						    <div style="font-size: large; color: black;">${commuBoard.userId}</div>
						</div>
					    
		                <span style="float:left; color:black;"><img src="/resources/img/icons/eye.png"/> ${commuBoard.commuViews}&nbsp;</span>
          					<span style="float:left; color:black;"><img src="/resources/img/icons/small_heart.png" style="margin-bottom:4px;"/> ${commuBoard.commuLikes}</span>
		                <span style="color:black; float:right; font-weight: bold;"> ${commuBoard.regDate}</span>
		              </div>
	              	</a>
	            </div>
	          </div>
	        </c:if>		
	         
	        <c:if test="${commuBoard.fileCheck ne 'Y'}">
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
           				<img class="img-fluid" style="object-fit: cover; height:261px;  border-radius:10px;" src="/resources/images/community/default.jpg">
		              </div>
		              <div class="text-center p-4">
		                <h3 class="mt-2" style="overflow:hidden; white-space:nowrap; text-overflow: ellipsis;">${commuBoard.commuTitle}</h3>
						<div style="display: flex; align-items: center;">
						    <div class="box" style="background: #BDBDBD; width: 24px; height: 24px; border-radius: 70%; overflow: hidden; margin-right: 10px;">
						        <img class="profile" src="/resources/images/profile/${commuBoard.userId}.${commuBoard.imageFileExt}" style="width: 100%; height: 100%; object-fit: cover;" />
						    </div>
						    <div style="font-size: large; color: black;">${commuBoard.userId}</div>
						</div>
					    
		                <span style="float:left; color:black;"><img src="/resources/img/icons/eye.png"/> ${commuBoard.commuViews}&nbsp;</span>
          					<span style="float:left; color:black;"><img src="/resources/img/icons/small_heart.png" style="margin-bottom:4px;"/> ${commuBoard.commuLikes}</span>
		                <span style="color:black; float:right; font-weight: bold;"> ${commuBoard.regDate}</span>
		              </div>
	              	</a>
	            </div>
	          </div>
	        </c:if>
        </c:if>
      </c:forEach>
    </div>
  </div>
</div>

<div class="container-xxl py-5">
  <div class="container">
    <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
      <h4 class="section-title">Ask</h4>
      <h1 class="display-5 mb-4"><a href="/community/ask" style="color:black">질문 게시판</a></h1>
    </div>


    <div class="row g-0 team-items">
      <c:forEach var="commuBoard" items="${list3}" varStatus="status">
      	<c:if test="${commuBoard.commuStatus eq 'Y'}">	
	        <c:if test="${commuBoard.fileCheck eq 'Y'}">
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
           				<img  class="img-fluid" style="object-fit: cover; height:261px;  border-radius:10px;" src="/resources/images/community/${commuBoard.commuIdk}.${commuBoard.fileExt}">
		              </div>
		              <div class="text-center p-4">
		                <h3 class="mt-2" style="overflow:hidden; white-space:nowrap; text-overflow: ellipsis;">${commuBoard.commuTitle}</h3>
						<div style="display: flex; align-items: center;">
						    <div class="box" style="background: #BDBDBD; width: 24px; height: 24px; border-radius: 70%; overflow: hidden; margin-right: 10px;">
						        <img class="profile" src="/resources/images/profile/${commuBoard.userId}.${commuBoard.imageFileExt}" style="width: 100%; height: 100%; object-fit: cover;" />
						    </div>
						    <div style="font-size: large; color: black;">${commuBoard.userId}</div>
						</div>
					    
		                <span style="float:left; color:black;"><img src="/resources/img/icons/eye.png"/> ${commuBoard.commuViews}&nbsp;</span>
          					<span style="float:left; color:black;"><img src="/resources/img/icons/small_heart.png" style="margin-bottom:4px;"/> ${commuBoard.commuLikes}</span>
		                <span style="color:black; float:right; font-weight: bold;"> ${commuBoard.regDate}</span>
		              </div>
	              	</a>
	            </div>
	          </div>
	        </c:if>		
	         
	        <c:if test="${commuBoard.fileCheck ne 'Y'}">
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
           				<img class="img-fluid" style="object-fit: cover; height:261px;  border-radius:10px;" src="/resources/images/community/default.jpg">
		              </div>
		              <div class="text-center p-4">
		                <h3 class="mt-2" style="overflow:hidden; white-space:nowrap; text-overflow: ellipsis;">${commuBoard.commuTitle}</h3>
						<div style="display: flex; align-items: center;">
						    <div class="box" style="background: #BDBDBD; width: 24px; height: 24px; border-radius: 70%; overflow: hidden; margin-right: 10px;">
						        <img class="profile" src="/resources/images/profile/${commuBoard.userId}.${commuBoard.imageFileExt}" style="width: 100%; height: 100%; object-fit: cover;" />
						    </div>
						    <div style="font-size: large; color: black;">${commuBoard.userId}</div>
						</div>
					    
		                <span style="float:left; color:black;"><img src="/resources/img/icons/eye.png"/> ${commuBoard.commuViews}&nbsp;</span>
          					<span style="float:left; color:black;"><img src="/resources/img/icons/small_heart.png" style="margin-bottom:4px;"/> ${commuBoard.commuLikes}</span>
		                <span style="color:black; float:right; font-weight: bold;"> ${commuBoard.regDate}</span>
		              </div>
	              	</a>
	            </div>
	          </div>
	        </c:if>
        </c:if>
      </c:forEach>
    </div>
  </div>
</div>

<form name="bbsForm" id="bbsForm" method="post">
	<input type="hidden" name="commuIdk" value="" />
	<input type="hidden" name="commuTab" value="" />
</form>

</body>

</html>