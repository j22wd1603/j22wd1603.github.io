<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<script src="https://kit.fontawesome.com/293152e236.js" crossorigin="anonymous"></script>

<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@600&display=swap" rel="stylesheet">
	
    <style>
        * {
			font-family: 'Noto Sans KR', sans-serif;        }
    </style>		
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#btnSearch").on("click", function() {
			document.bbsForm.commuIdk.value = "";
			document.bbsForm.sortType.value = $("#_sortType").val();
			document.bbsForm.searchType.value = $("#_searchType").val();
			document.bbsForm.searchValue.value = $("#_searchValue").val();
			document.bbsForm.curPage.value = "1";
			document.bbsForm.action = "/community/myroom";
			document.bbsForm.submit();
		});
		
		$("#btnWrite").on("click", function() {
			document.bbsForm.commuIdk.value = "";
			document.bbsForm.commuTab.value = "1";
			document.bbsForm.action = "/community/writeForm";
			document.bbsForm.submit();
		});
		
	});
	
	function fn_list(curPage)
	{
		document.bbsForm.commuIdk.value = "";
		document.bbsForm.curPage.value = curPage;
		document.bbsForm.action = "/community/myroom";
		document.bbsForm.submit();
	}
	
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

   <%@ include file="/WEB-INF/views/include/navigation.jsp" %>
   
    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown"><a class="text-white" href="/community/blog">Community</a></h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb text-uppercase mb-0">
                    <li class="breadcrumb-item text-primary active" aria-current="community/myroom">마이룸</li>
                    <li class="breadcrumb-item"><a class="text-white" href="/community/ask">질문게시판</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="/community/free">자유게시판</a></li>
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
      <h1 class="display-5 mb-4"><a href="/community/myroom" style="color:black">마이룸 월간베스트</a></h1>
    </div>
    <div class="row g-0 team-items">
    
      <c:forEach var="commuBoard" items="${listByMonthlyLikes}" varStatus="status">
      	<c:if test="${commuBoard.commuStatus eq 'Y'}">	
	        <c:if test="${commuBoard.fileCheck eq 'Y'}">
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
           				<img  class="img-fluid" style="object-fit: cover; height:407.98px; width:408px; border-radius:5px;" src="/resources/images/community/${commuBoard.commuIdk}.${commuBoard.fileExt}">
		              </div>
		              <div class="bg-light text-center p-4">
			            <h3 style="overflow:hidden; white-space:nowrap; text-overflow: ellipsis;" class="mt-2">${commuBoard.commuTitle}</h3>
		                <h3 class="mt-2">${commuBoard.regDate}</h3>
		                <h3 class="mt-2">${commuBoard.userId}</h3>
		                <span class="text-primary" ><img src="/resources/img/icons/eye.png"/> ${commuBoard.commuViews}</span>
           				<span class="text-primary" ><img src="/resources/img/icons/small_heart.png" style="margin-bottom:4px;"/> ${commuBoard.commuLikes}</span>		                
		              </div>
	              	</a>
	          </div>
	        </c:if>
	        <c:if test="${commuBoard.fileCheck ne 'Y'}">
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative" style="color:white;">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
		                <img class="img-fluid" src="/resources/images/community/default.jpg" style="border-radius:5px;">
		              </div>
		              <div class="text-center p-4">
			            <h3 style="overflow:hidden; white-space:nowrap; text-overflow: ellipsis;" class="mt-2">${commuBoard.commuTitle}</h3>
		              </div>
	              	</a>
	            </div>
	          </div>
	        </c:if>	
        </c:if>
											
      	<c:if test="${commuBoard.commuStatus eq 'N'}">	
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
			                <img class="img-fluid" src="/resources/images/community/delete.jpg">
		              </div>
		              <div class="bg-light text-center p-4" style="height:204.78px;">
		                <h3 class="mt-2">운영정책에 의해 삭제된 게시물입니다.</h3>
		              </div>
	              	</a>
	            </div>
	          </div>
        </c:if>    
            
      </c:forEach>
    </div>
  </div>
</div>


<div class="container-xxl py-5">
  <div class="container">
  
   <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s">
        <select name="_sortType" id="_sortType" class="custom-select" style="width:auto; padding:5px; font-weight:bold;">
          <option value="" style="font-weight:bold;">조회 항목</option>
          <option value="1" style="font-weight:bold;" <c:if test='${sortType eq "1"}'>selected</c:if>>최신순</option>
          <option value="2" style="font-weight:bold;" <c:if test='${sortType eq "2"}'>selected</c:if>>과거순</option>
          <option value="3" style="font-weight:bold;" <c:if test="${sortType eq '3'}">selected</c:if>>인기순</option>                 	
        </select>
	             	
	    <select name="_searchType" id="_searchType" class="custom-select" style="width:auto; padding:5px; font-weight:bold;">
			<option value="" style="font-weight:bold;">검색 항목</option>
			<option value="1" style="font-weight:bold;" <c:if test='${searchType eq "1"}'>selected</c:if>>작성자</option>
			<option value="2" style="font-weight:bold;" <c:if test='${searchType eq "2"}'>selected</c:if>>제목</option>
			<option value="3" style="font-weight:bold;" <c:if test="${searchType eq '3'}">selected</c:if>>내용</option>
		</select>
		
 		<input type="text" style="width:196px; ime-mode:active; font-weight:bold;" name="_searchValue" id="_searchValue" value="${searchValue}" class="justify-content-center" maxlength="20" placeholder="조회값을 입력하세요." />
        <button type="button" id="btnSearch" class="btn btn-secondary mb-3 mx-1" style="color:#9E0E0B; background-color:white; font-weight:bold; border-radius:3px; height:30px;">조회</button>
	 </div>
	    
    <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
      <h1 class="display-5 mb-4"><a href="/community/myroom" style="color:black">마이룸 커뮤니티</a></h1>
    </div>
             
    
    
    <div class="row g-0 team-items">
		 <c:forEach var="commuBoard" items="${list}" varStatus="status">
		 
	      	<c:if test="${commuBoard.commuStatus eq 'Y'}">	
		        <c:if test="${commuBoard.fileCheck eq 'Y'}">
		          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
		            <div class="team-item position-relative">  
						<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
			              <div class="position-relative">
            				<img  class="img-fluid" style="object-fit: cover; height:261px; width:408px; border-radius:10px;" src="/resources/images/community/${commuBoard.commuIdk}.${commuBoard.fileExt}">
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
            				<img class="img-fluid" style="object-fit: cover; height:261px; width:408px; border-radius:10px;" src="/resources/images/community/default.jpg">
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
	        
	        
	      	<c:if test="${commuBoard.commuStatus eq 'N'}">	
		          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
		            <div class="team-item position-relative">  
						<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
			              <div class="position-relative">
				                <img class="img-fluid" src="/resources/images/community/delete.jpg" style="border-radius:5px;">
			              </div>
		              	  <div class="bg-light text-center p-4">
			                <h3 class="mt-2">삭제된 게시물 입니다.</h3>
			                <h3 class="mt-2">Delete: ${commuBoard.deleteDate}</h3>
			                <h3 class="mt-2">${commuBoard.userId}</h3>
			                <span class="text-primary" ><img src="/resources/img/icons/eye.png"/> ${commuBoard.commuViews}</span>
           					<span class="text-primary" ><img src="/resources/img/icons/small_heart.png" style="margin-bottom:4px;"/> ${commuBoard.commuLikes}</span>		                
			              </div>	              	
			             </a>              	
		            </div>
		          </div>
	        </c:if>        	        

		</c:forEach>
    </div>
  </div>
</div>

	<nav>
		<ul class="pagination justify-content-center" style="padding-top: 5%;  padding-bottom:5%;">
			<c:if test="${paging.prevBlockPage gt 0}">
				<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})"><i class="bi bi-arrow-left"></i></a></li>
			</c:if>
				<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
						<c:choose>
							<c:when test="${i ne curPage}">
								<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item active"><a class="page-link" href="javascript:void(0)" style="cursor:default;">${i}</a></li>
							</c:otherwise>
						</c:choose>
				</c:forEach>
			<c:if test="${paging.nextBlockPage gt 0}">
				<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})"><i class="bi bi-arrow-right"></i></a></li>
			</c:if>
		</ul>
	</nav>         

	<form name="bbsForm" id="bbsForm" method="post">
		<input type="hidden" name="commuIdk" value="" />
		<input type="hidden" name="commuTab" value="" />
		<input type="hidden" name="curPage" value="${curPage}"/>
		<input type="hidden" name="searchType" value="${searchType}" />
		<input type="hidden" name="searchValue" value="${searchValue}" />
		<input type="hidden" name="sortType" value="${sortType}" />
	</form>

    
</body>

</html>