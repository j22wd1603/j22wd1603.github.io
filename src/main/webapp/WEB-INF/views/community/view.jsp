<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    
    
    
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
	
    <style>
        * {
			font-family: 'Noto Sans KR', sans-serif;        }
    </style>    
    
    <style>
    
    
    pre {
    
    	font-family: 'Pretendard Variable',sans-serif;    
		letter-spacing: -0.3px;
    	-webkit-font-smoothing: antialiased;    
    	
		margin: 24px 0px;
	    padding: 0px 16px;
	    font-size: 16px;
	    line-height: 24px;
	    color: rgb(47, 52, 56);
	    white-space: pre-line;        		
    }    
  
    
    .trWhite {
    	background-color:white;
    }
    </style>
    
<script>
	$(document).ready(function() {
		
		
		$("#btnList").on("click", function() {
			
			document.bbsForm.action = "${redirectUrl}";
			document.bbsForm.submit();
		});
		
		$("#btnUpdate").on("click", function() {
			document.bbsForm.action = "/community/updateForm";
			document.bbsForm.submit();
		});

	
		$("#btnDelete").on("click", function(){
			if(confirm("게시물을 삭제 하시겠습니까?") == true)
			{
				$.ajax({
					type:"POST",
					url:"/community/delete",
					data:{
						commuIdk:<c:out value="${commuIdk}" />
					},
					datatype:"JSON",
					beforeSend:function(xhr)
					{
						xhr.setRequestHeader("AJAX", "true");
					},
					success:function(response)
					{
						if(response.code == 0)
						{
							alert("게시물이 삭제 되었습니다.");
							location.href = "${redirectUrl}";
						}
						else if(response.code == 400)
						{
							alert("파라미터 값이 올바르지 않습니다.");
						}
						else if(response.code == 403)
						{
							alert("본인 글이 아니므로 삭제할 수 없습니다.");
						}
						else if(response.code == 404)
						{
							alert("해당 게시물을 찾을 수 없습니다.");
							location.href = "${redirectUrl}";
						}
						else
						{
							alert("게시물 삭제 시 오류가 발생하였습니다.");
						}
					},
					error:function(xhr, status, error)
					{
						icia.common.error(error);
					}
				});
			}
		});		
		
		
		$("#btnHeart").on("click", function() {
			
			
			var btnHeart = document.getElementById('btnHeart');
			
			var btnFilledHeart = document.getElementById('btnFilledHeart');
			
			
			$.ajax({
				type:"POST",
				url:"/community/likesInsert",
				data:{
					commuIdk:<c:out value="${commuIdk}" />
				},
				datatype:"JSON",
				beforeSend:function(xhr)
				{
					xhr.setRequestHeader("AJAX", "true");
				},
				success:function(response)
				{
					if(response.code == 0)
					{
						alert("좋아요를 눌렀습니다.");

						document.bbsForm.action = "/community/view";
						document.bbsForm.submit();	
						
					}
					else if(response.code == 400)
					{
						alert("파라미터 값이 올바르지 않습니다.");
					}
					else if(response.code == 403)
					{
						alert("로그인이 필요합니다.");
					}
					else if(response.code == 404)
					{
						alert("해당 게시물을 찾을 수 없습니다.");
						location.href = "/community/blog";
					}
					else
					{
						alert("좋아요를 누르는 과정에서 오류가 발생하였습니다.");
					}
				},
				error:function(xhr, status, error)
				{
					icia.common.error(error);
				}
			});
			
		});
		
		$("#btnFilledHeart").on("click", function() {
			
			var btnFilledHeart = document.getElementById('btnFilledHeart');
			
			var btnHeart = document.getElementById('btnHeart');
			
			
			$.ajax({
				type:"POST",
				url:"/community/likesDelete",
				data:{
					commuIdk:<c:out value="${commuIdk}" />
				},
				datatype:"JSON",
				beforeSend:function(xhr)
				{
					xhr.setRequestHeader("AJAX", "true");
				},
				success:function(response)
				{
					if(response.code == 0)
					{
						alert("좋아요를 취소 하였습니다.");
						
						document.bbsForm.action = "/community/view";
						document.bbsForm.submit();						
					}
					else if(response.code == 400)
					{
						alert("파라미터 값이 올바르지 않습니다.");
					}
					else if(response.code == 403)
					{
						alert("로그인이 필요합니다.");
					}
					else if(response.code == 404)
					{
						alert("해당 게시물을 찾을 수 없습니다.");
						location.href = "/community/blog";
					}
					else
					{
						alert("좋아요를 취소하는 과정에서 오류가 발생하였습니다.");
					}
				},
				error:function(xhr, status, error)
				{
					icia.common.error(error);
				}
			});	
				
			
		});
		
		$("#btnScrap").on("click", function() {
			
			
			var btnScrap = document.getElementById('btnScrap');
			
			var btnFilledScrap = document.getElementById('btnFilledScrap');
			
			$.ajax({
				type:"POST",
				url:"/community/scrapInsert",
				data:{
					commuIdk:<c:out value="${commuIdk}" />
				},
				datatype:"JSON",
				beforeSend:function(xhr)
				{
					xhr.setRequestHeader("AJAX", "true");
				},
				success:function(response)
				{
					if(response.code == 0)
					{
						alert("스크랩 등록을 하였습니다.");
						
						btnScrap.style.display = 'none';
						btnFilledScrap.style.display = 'block';						
					}
					else if(response.code == 400)
					{
						alert("파라미터 값이 올바르지 않습니다.");
					}
					else if(response.code == 403)
					{
						alert("로그인이 필요합니다.");
					}
					else if(response.code == 404)
					{
						alert("해당 게시물을 찾을 수 없습니다.");
						location.href = "/community/blog";
					}
					else
					{
						alert("스크랩을 누르는 과정에서 오류가 발생하였습니다.");
					}
				},
				error:function(xhr, status, error)
				{
					icia.common.error(error);
				}
			});				

		});
		
		
		$("#btnFilledScrap").on("click", function() {
			
			var btnFilledScrap = document.getElementById('btnFilledScrap');
			
			var btnScrap = document.getElementById('btnScrap');
			
			$.ajax({
				type:"POST",
				url:"/community/scrapDelete",
				data:{
					commuIdk:<c:out value="${commuIdk}" />
				},
				datatype:"JSON",
				beforeSend:function(xhr)
				{
					xhr.setRequestHeader("AJAX", "true");
				},
				success:function(response)
				{
					if(response.code == 0)
					{
						alert("스크랩을 취소하였습니다.");
						btnFilledScrap.style.display = 'none';
						btnScrap.style.display = 'block';						
					}
					else if(response.code == 400)
					{
						alert("파라미터 값이 올바르지 않습니다.");
					}
					else if(response.code == 403)
					{
						alert("로그인이 필요합니다.");
					}
					else if(response.code == 404)
					{
						alert("해당 게시물을 찾을 수 없습니다.");
						location.href = "/community/blog";
					}
					else
					{
						alert("스크랩을 취소하는 과정에서 오류가 발생하였습니다.");
					}
				},
				error:function(xhr, status, error)
				{
					icia.common.error(error);
				}
			});				

		});

	});
	

	
//댓글 삭제
function commentDelete(commentIdk) {
	
    if (confirm("댓글을 삭제 하시겠습니까?") == true) 
    {
		$.ajax({
			type:"POST",
			url:"/community/commentDelete",
			data:{
				commuIdk:$("#commuIdk").val(),
				commentIdk: commentIdk
				
			},
			datatype:"JSON",
			beforeSend:function(xhr)
			{
				xhr.setRequestHeader("AJAX", "true");
			},
			success:function(response)
			{
				if(response.code == 0)
				{
					alert("게시물이 삭제 되었습니다.");
					document.bbsForm.action = "/community/view";
					document.bbsForm.submit();					
				}
				else if(response.code == 400)
				{
					alert("파라미터 값이 올바르지 않습니다.");
				}
				else if(response.code == 403)
				{
					alert("본인 글이 아니므로 삭제할 수 없습니다.");
				}
				else if(response.code == 404)
				{
					alert("해당 게시물을 찾을 수 없습니다.");
					location.href = "/community/blog";
				}
				else if(response.code == 500)
				{
					alert("게시물 삭제 시 오류가 발생하였습니다.");
				}
				else
				{
					alert("게시물 삭제 시 오류가 발생하였습니다.");
				}
			},
			error:function(xhr, status, error)
			{
				icia.common.error(error);
			}
		});

    }
}

//수정 버튼을 눌렀을 때 나오는 수정 폼
function commentUpdateEvent(count){
	
	var btnReplyUpdate = document.getElementById('btnReplyUpdate' + count);
	
	var commentContent = document.getElementById('commentContent' + count);
	
	var commentUpdateContent = document.getElementById('commentUpdateContent' + count);
		
	//댓글 수정 버튼 숨기기 및 보이기
	if(btnReplyUpdate.style.display != 'none'){
		btnReplyUpdate.style.display = 'none';
	}
	else{
		btnReplyUpdate.style.display = 'block';
	}
	
	//댓글 내용 보이기 및 숨기기
	if(commentContent.style.display != 'none'){
		commentContent.style.display = 'none';
	}
	else{
		commentContent.style.display = 'block';
	}
	
	//수정 할 내용 보이기 및 숨기기
	if(commentUpdateContent.style.display != 'none'){
		commentUpdateContent.style.display = 'none';
	}
	else{
		commentUpdateContent.style.display = 'block';
	}	
}

//대댓글 수정 버튼을 눌렀을 때 나오는 수정 폼
function replyUpdateEvent(count){
	
	var btnReplyUpdate = document.getElementById('btnReplyUpdate' + count);
	
	var commentContent = document.getElementById('commentContent' + count);
	
	var commentUpdateContent = document.getElementById('commentUpdateContent' + count);
		
	//댓글 수정 버튼 숨기기 및 보이기
	if(btnReplyUpdate.style.display != 'none'){
		btnReplyUpdate.style.display = 'none';
	}
	else{
		btnReplyUpdate.style.display = 'block';
	}
	
	//수정 할 내용 보이기 및 숨기기
	if(commentUpdateContent.style.display != 'none'){
		commentUpdateContent.style.display = 'none';
	}
	else{
		commentUpdateContent.style.display = 'block';
	}	
}



//댓글 수정
function commentUpdate(commentIdk, count){
	
	var AJAXcommentIdk = commentIdk;
	var AJAXcontent = "";
	
		
	if($.trim($("#commentUpdateContent"+count).val()).length <= 0)
	{
		
		alert("수정 할 내용을 입력하세요.");
		$("#commentUpdateContent"+count).val("");
		$("#commentUpdateContent"+count).focus();	
		
		return;
	}
	
	AJAXcontent = $("#commentUpdateContent"+count).val()
	
	
	$.ajax({
		type:"POST",
		url:"/community/commentUpdate",
		data:{
			commentUpdateContent:AJAXcontent,
			commentIdk: commentIdk
		},
		dataType:"JSON",
		beforeSend:function(xhr)
		{
			xhr.setRequestHeader("AJAX", "true");
		},
		success:function(response)
		{
			if(response.code == 0)
			{
				alert("댓글이 수정되었습니다.");
				document.bbsForm.action = "/community/view";
				document.bbsForm.submit();
			}
			else if(response.code == 400)
			{
				alert("파라미터 값이 올바르지 않습니다.");
				$("#mainCommentContent").focus();
			}
			else if(response.code == -999){
				alert("댓글 수정 중 오류가 발생하였습니다.");
				location.href = "/community/blog";
			}
			else
			{
				alert("댓글 수정 중 오류 발생");
				$("#mainCommentContent").focus();
			}
		},
		error:function(error)
		{
			icia.common.error(error);
			result = -999;
		}
		
	});	
	
	
}


//댓글 등록	
function commentInsert(commentIdk,count) {
	
	var AJAXcommentIdk = "";
	var AJAXparentIdk = 0;	
	var AJAXcontent = "";
	
	
	//commentIdk가 -1이면 댓글 -1이 아니면 대댓글.
	if(commentIdk != -1){
		
		if($.trim($("#commentContent"+count).val()).length <= 0)
		{
			
			alert("대댓글을 입력하세요.");
			$("#commentContent"+count).val("");
			$("#commentContent"+count).focus();	
			
			return;
		}
		
		AJAXcommentIdk =  commentIdk;
		AJAXparentIdk = 0;	
		AJAXcontent = $("#commentContent"+count).val()
	}
	else{
		
		if($.trim($("#mainCommentContent").val()).length <= 0)
		{
			alert("댓글을 입력하세요.");
			$("#mainCommentContent").val("");
			$("#mainCommentContent").focus();	
			
			return;
		}		
		
		AJAXcommentIdk = 0;
		AJAXparentIdk = 1;
		AJAXcontent = $("#mainCommentContent").val()
	}
	
		$.ajax({
			type:"POST",
			url:"/community/commentProc",
			data:{
				commuIdk:$("#commuIdk").val(),
				commentContent:AJAXcontent,
				parentIdk:AJAXparentIdk,
				commentIdk: commentIdk
			},
			dataType:"JSON",
			beforeSend:function(xhr)
			{
				xhr.setRequestHeader("AJAX", "true");
			},
			success:function(response)
			{
				if(response.code == 0)
				{
					alert("댓글이 등록되었습니다.");
					document.bbsForm.action = "/community/view";
					document.bbsForm.submit();
				}
				else if(response.code == 400)
				{
					alert("로그인이 필요합니다.");
				}
				else if(response.code == -999){
					alert("댓글 등록 중 오류가 발생하였습니다.");
					location.href = "/community/blog";
				}
				else
				{
					alert("댓글 등록 중 오류 발생");
					$("#mainCommentContent").focus();
				}
			},
			error:function(error)
			{
				icia.common.error(error);
				result = -999;
			}
			
		});
	
}
</script>
    

</head>

<body>

   <%@ include file="/WEB-INF/views/include/navigation.jsp" %>
   
    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <h1 class="display-1 text-white animated slideInDown">Community</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb text-uppercase mb-0">
					<c:if test="${community.commuTab eq '1'}">
	                    <li class="breadcrumb-item text-primary active" aria-current="community/myroom" style="color:#9E0E0B; font-weight:bold;">마이룸</li>
	                    <li class="breadcrumb-item"><a class="text-white" href="/community/ask">질문게시판</a></li>
	                    <li class="breadcrumb-item"><a class="text-white" href="/community/free">자유게시판</a></li>
					</c:if>
					
					<c:if test="${community.commuTab eq '2'}">
	                    <li class="breadcrumb-item"><a class="text-white" href="/community/myroom">마이룸</a></li>
	                    <li class="breadcrumb-item"><a class="text-white" href="/community/ask" >질문게시판</a></li>
	                    <li class="breadcrumb-item text-primary active" aria-current="community/free" style="color:#9E0E0B; font-weight:bold;">자유게시판</li>
					</c:if>
					
					<c:if test="${community.commuTab eq '3'}">
	                    <li class="breadcrumb-item"><a class="text-white" href="/community/myroom">마이룸</a></li>
	                    <li class="breadcrumb-item text-primary active" aria-current="community/ask" style="color:#9E0E0B; font-weight:bold;">질문게시판</li>
	                    <li class="breadcrumb-item"><a class="text-white" href="/community/free">자유게시판</a></li>
					</c:if>		                
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


<!-- Team Start -->
<c:if test="${community.commuStatus eq 'Y'}">	
	<div class="container">
		<table style="margin-left:auto; margin-right:auto; width:718px;">
		
			<thead>
			    <tr>
              		<p style="text-align:center; font-size:32px; color:black; font-weight:bold;">${community.commuTitle}</p>
			    </tr>
			    
			    <tr>
			        <th scope="col" style="text-align:left; width:30%;">
			            <div class="box" style="background: #BDBDBD; width:64px; height:64px; border-radius:70%; overflow:hidden; float:left; margin:10px;"> 
			                <img class="profile" src="/resources/images/profile/${boardUser.userId}.${boardUser.imageFileExt}" style="width:100%; height:100%; object-fit:cover;"/>
			            </div>    
			            <h4 style="margin:0px;">${boardUser.userId}</h4>
			            <p style="margin:0px;">${community.regDate}</p>
			        </th>
			        
	      		    <th scope="col" style="text-align:right; width:70%;">
			            조회 <fmt:formatNumber type="number" maxFractionDigits="3" value="${community.commuViews}" /><br/>        
			            좋아요 <fmt:formatNumber type="number" maxFractionDigits="3" value="${community.commuLikes}" />
			        </th>
			    </tr>
		    </thead>
		    
		    
			<tbody>
			    <tr>
			        <td colspan="4">
			            <c:if test="${community.fileCheck eq 'Y'}">
			                <div style="text-align : center;">
			                    <img style="width:718px; height:auto; " src="/resources/images/community/${community.commuIdk}.${community.fileExt}">
			                </div>
			            </c:if>
			        </td>
			    </tr>
			    
			    <tr>
			    		<th></th>
			    		<th style="padding-bottom:10px;">
							<c:if test="${userScrap eq 1}">
									<button type ="button" id="btnFilledScrap" style="border:none; background-color:transparent; padding:0; margin:5px; display:block; float:right;"><img src="/resources/img/icons/icon_bookmark_filled.png"/></button>
									<button type ="button" id="btnScrap" style="border:none; background-color:transparent; padding:0; margin:5px; display:none; float:right;"><img src="/resources/img/icons/icon_bookmark.png"/></button>
							</c:if>
							
							<c:if test="${userScrap eq 0}">
									<button type ="button" id="btnFilledScrap" style="border:none; background-color:transparent; padding:0; margin:5px; display:none; float:right;"><img src="/resources/img/icons/icon_bookmark_filled.png"/></button>
									<button type ="button" id="btnScrap" style="border:none; background-color:transparent; padding:0; margin:5px; display:block; float:right;"><img src="/resources/img/icons/icon_bookmark.png"/></button>
							</c:if>	
									    		
							<c:if test="${userLikes eq 1}">
									<button type="button" id="btnFilledHeart" style="border:none; background-color:transparent; padding:0; margin:5px; display:block; float:right;"><img src="/resources/img/icons/icon_heart_filled.png"/></button>
							</c:if>
							
							<c:if test="${userLikes eq 0}">
									<button type="button" id="btnHeart" style="border:none; background-color:transparent; padding:0; margin:5px; display:block; float:right;"><img src="/resources/img/icons/icon_heart.png"/></button>
							</c:if>	
						</th>
				</tr>
				
				
              	  <tr style="border-top:2px solid #bfbfbf; border-bottom:2px solid #bfbfbf;">
	                <td colspan="2"><pre style="height:300px; white-space: pre-wrap; word-break: break-all; overflow: auto;"><c:out value="${community.commuContent}" /></pre></td>
	              </tr>
				
			</tbody>
			
			
		</table>
		
		
		<div style="margin-top:50px;">
	    	<table style="margin-left:auto; margin-right:auto; width:718px;">
					<tr>
						<td colspan="2">
						   <form name="comment" id="comment" method="post">
						      <div class="form-group">
						         <textarea class="form-control" rows="1" name="mainCommentContent" id="mainCommentContent" style="ime-mode:active;" placeholder="내용을 입력해주세요" required></textarea>
						      </div>
						      <button type="button" style="background-color:white; border:none; padding:0px; margin:5px; float:right; color:black" id="btnReplyWrite" class="btn btn-secondary"  onclick="commentInsert(-1,0)">댓글 등록하기</button>
						   </form>						    
						</td>
					</tr>			
		
					<c:set var="count" value= "0" />
				<c:if test="${!empty commentList}">
					<c:forEach var="commentList" items="${commentList}" varStatus="status">
					<c:set var="count" value = "${count+1}" />
					<tr>
					
					<c:choose>
						<c:when test="${commentList.parentIdk eq 1 && commentList.commentStatus eq 'Y'}">									
							<td>
							    <div class="box" style="background: #BDBDBD; width:48px; height:48px; border-radius:70%; overflow:hidden;"> 
							        <img class="profile" src="/resources/images/profile/${commentList.userId}.${commentList.imageFileExt}" style="width:100%; height:100%; object-fit:cover;"/>
							    </div>							
							
								<div style="font-size:large; color:black; margin-left:1px">${commentList.userId}</div>
								<div style="color:black">${commentList.commentContent}</div>
								<div style="">${commentList.regDate}</div>
							         <textarea class="form-control" rows="1" name="commentContent${count}" id="commentContent${count}" style="ime-mode:active; dlsplay:block;" placeholder="내용을 입력해주세요" required></textarea>
							         <textarea class="form-control" rows="1" name="commentUpdateContent${count}" id="commentUpdateContent${count}" style="ime-mode:active; display:none;" placeholder="수정 할 내용을 입력해주세요." required></textarea>
								<c:if test="${cookieUserId eq commentList.userId}">	
									<button type="button" style="background-color:white; margin:5px; padding:0px; float:right; border:none; color:black" name="btnReplyDelete" id="btnReplyDelete" class="btn btn-secondary" onclick="commentDelete(${commentList.commentIdk})">삭제</button>
									<button type="button" style="background-color:white; margin:5px; padding:0px; float:right; border:none; color:black" name="btnReplyEvent${count}" id="btnReplyEvent${count}" class="btn btn-secondary" onclick="commentUpdateEvent(${count})">수정</button>
									<button type="button" style="background-color:white; border:none; color:black; display: none;" name="btnReplyUpdate${count}" id="btnReplyUpdate${count}" class="btn btn-secondary" onclick="commentUpdate(${commentList.commentIdk},${count})">수정 완료</button>								
								</c:if>	
						      	  <button type="button" style="background-color:white; margin:5px; padding:0px; float:right; border:none; color:black" name="btnReplyWrite${count}" id="btnReplyWrite${count}" class="btn btn-secondary" onclick="commentInsert(${commentList.commentIdk},${count})">등록</button>
							</td>
						</c:when>
						<c:when test="${commentList.parentIdk eq 1 && commentList.commentStatus eq 'N'}">									
							<td>
								<div style="color:black">관리자에 의해 삭제 된 댓글입니다.</div>
							</td>
						</c:when>	
						
	
						<c:when test="${commentList.parentIdk eq 0 && commentList.commentStatus eq 'Y'}">
							<td>
								<img src="/resources/img/icons/icon_reply.png" style="margin-left:1em; float:left"/>
								
								    <div class="box" style="background: #BDBDBD; width:48px; height:48px; border-radius:70%; overflow:hidden; float:left; margin:10px;"> 
								        <img class="profile" src="/resources/images/profile/${commentList.userId}.${commentList.imageFileExt}" style="width:100%; height:100%; object-fit:cover;"/>
								    </div>	
				            		<h4 style="margin:0px;">${commentList.userId}</h4>
				            		<p style="margin:0px;">${commentList.regDate}</p>
								
								<div style="margin-left:3em; color:black;">${commentList.commentContent}</div>
							         <textarea class="form-control" rows="1" name="commentUpdateContent${count}" id="commentUpdateContent${count}" style="ime-mode:active; display:none;" placeholder="수정 할 내용을 입력해주세요." required></textarea>
								<c:if test="${cookieUserId eq commentList.userId}">	
									<button type="button" style="background-color:white; margin:5px; padding:0px; float:right; border:none; color:black" id="btnReplyDelete" name="btnReplyUpdate${count}" class="btn btn-secondary" onclick="commentDelete(${commentList.commentIdk})">삭제</button>
									<button type="button" style="background-color:white; margin:5px; padding:0px; float:right; border:none; color:black" name="btnReplyEvent${count}" id="btnReplyEvent${count}" class="btn btn-secondary" onclick="replyUpdateEvent(${count})">수정</button>
									<button type="button" style="background-color:white; border:none; color:black; display: none;" name="btnReplyUpdate${count}" id="btnReplyUpdate${count}" class="btn btn-secondary" onclick="commentUpdate(${commentList.commentIdk},${count})">수정 완료</button>								
								</c:if>
							</td>
						</c:when>	
						<c:when test="${commentList.parentIdk eq 0 && commentList.commentStatus eq 'N'}">									
							<td>
								<img src="/resources/img/icons/icon_reply.png" style="margin-left:1em; float:left"/>
								<div style="color:black">관리자에 의해 삭제 된 댓글입니다.</div>
							</td>
						</c:when>										
					</c:choose>
									
					</tr>
					</c:forEach>
				</c:if>					
			</table>
		</div>		
        <div class="container" style="margin-left:auto; margin-right:auto; width:718px; margin-top:50px;">
			<c:if test="${community.commuTab eq '1'}">	
				<button type="button" id="btnList" class="btn btn-secondary" style="background-color:white; background-color:white; color:#9E0E0B; border-radius:3px;">마이룸 가기</button>
			</c:if>
			<c:if test="${community.commuTab eq '2'}">	
				<button type="button" id="btnList" class="btn btn-secondary" style="background-color:white; background-color:white; color:#9E0E0B; border-radius:3px;">자유게시판 가기</button>
			</c:if>		
			<c:if test="${community.commuTab eq '3'}">	
				<button type="button" id="btnList" class="btn btn-secondary" style="background-color:white; background-color:white; color:#9E0E0B; border-radius:3px;">질문게시판 가기</button>
			</c:if>		
			<c:if test="${boardMe eq 'Y'}">	
				<button type="button" id="btnUpdate" class="btn btn-secondary" style="float:right; background-color:white; color:#9E0E0B; border-radius:3px;">수정</button>
				<button type="button" id="btnDelete" class="btn btn-secondary" style="float:right; background-color:white; color:#9E0E0B; border-radius:3px;">삭제</button>
			</c:if>				
		</div>
		<br/>
		<br/>
	</div>
</c:if>
		
    <c:if test="${community.commuStatus ne 'Y'}">	
	    <div class="position-relative">
	       <img class="img-fluid" src="/resources/images/community/delete.jpg">
	    </div>
	    <div class="bg-light text-center p-4">
	      <h3 class="mt-2">운영정책에 의해 삭제된 게시물입니다.</h3>
	    </div>
		    	<div class="container">
				    <table>
				    	<tbody>
								<c:set var="count" value= "0" />
							<c:if test="${!empty commentList}">
								<c:forEach var="commentList" items="${commentList}" varStatus="status">
								<c:set var="count" value = "${count+1}" />
								<tr>
								
								<c:choose>
									<c:when test="${commentList.parentIdk eq 1 && commentList.commentStatus eq 'Y'}">									
										<td>
											<div style="font-size:large; color:black; margin-left:1px">${commentList.userId}</div>
											<div style="color:black">${commentList.commentContent}</div>
											<div style="">${commentList.regDate}</div>
										         <textarea class="form-control" rows="1" name="commentContent${count}" id="commentContent${count}" style="ime-mode:active; dlsplay:block;" placeholder="내용을 입력해주세요" required></textarea>
										         <textarea class="form-control" rows="1" name="commentUpdateContent${count}" id="commentUpdateContent${count}" style="ime-mode:active; display:none;" placeholder="수정 할 내용을 입력해주세요." required></textarea>
									      	  <button type="button" style="background-color:#EFEFEF; color:black" name="btnReplyWrite${count}" id="btnReplyWrite${count}" class="btn btn-secondary" onclick="commentInsert(${commentList.commentIdk},${count})">대댓글 등록하기</button>
											<c:if test="${cookieUserId eq commentList.userId}">	
												<button type="button" style="background-color:#EFEFEF; color:black" name="btnReplyEvent${count}" id="btnReplyEvent${count}" class="btn btn-secondary" onclick="commentUpdateEvent(${count})">수정하기</button>
												<button type="button" style="background-color:#EFEFEF; color:black; display: none;" name="btnReplyUpdate${count}" id="btnReplyUpdate${count}" class="btn btn-secondary" onclick="commentUpdate(${commentList.commentIdk},${count})">수정 완료</button>								
												<button type="button" style="background-color:#EFEFEF; color:black" name="btnReplyDelete" id="btnReplyDelete" class="btn btn-secondary" onclick="commentDelete(${commentList.commentIdk})">삭제</button>
											</c:if>						   									
										</td>
									</c:when>
									<c:when test="${commentList.parentIdk eq 1 && commentList.commentStatus eq 'N'}">									
										<td>
											<div style="color:black">관리자에 의해 삭제 된 댓글입니다.</div>
										</td>
									</c:when>									
									
									
									<c:when test="${commentList.parentIdk eq 0 && commentList.commentStatus eq 'Y'}">
										<td>
											<img src="/resources/img/icons/icon_reply.png" style="margin-left:1em; float:left"/>
											<div style="margin-left:50px; font-size:large; color:black">${commentList.userId}</div>
											<div style="margin-left:3em; color:black;">${commentList.commentContent}</div>
											<div style="margin-left:3em">${commentList.regDate}</div>
										         <textarea class="form-control" rows="1" name="commentUpdateContent${count}" id="commentUpdateContent${count}" style="ime-mode:active; display:none;" placeholder="수정 할 내용을 입력해주세요." required></textarea>
											<c:if test="${cookieUserId eq commentList.userId}">	
												<button type="button" style="background-color:#EFEFEF; color:black" name="btnReplyEvent${count}" id="btnReplyEvent${count}" class="btn btn-secondary" onclick="commentUpdateEvent(${count})">수정하기</button>
												<button type="button" style="background-color:#EFEFEF; color:black; display: none;" name="btnReplyUpdate${count}" id="btnReplyUpdate${count}" class="btn btn-secondary" onclick="commentUpdate(${commentList.commentIdk},${count})">수정 완료</button>								
												<button type="button" style="background-color:#EFEFEF; color:black" id="btnReplyDelete" name="btnReplyUpdate${count}" class="btn btn-secondary" onclick="commentDelete(${commentList.commentIdk})">삭제</button>
											</c:if>
										</td>
									</c:when>
									<c:when test="${commentList.parentIdk eq 0 && commentList.commentStatus eq 'N'}">									
										<td>
											<img src="/resources/img/icons/icon_reply.png" style="margin-left:1em; float:left"/>
											<div style="color:black">관리자에 의해 삭제 된 댓글입니다.</div>
										</td>
									</c:when>										
								</c:choose>
												
								</tr>
								</c:forEach>
							</c:if>		    	
				    	</tbody>
				    </table>
			    </div>
		<button type="button" id="btnList" class="btn btn-secondary">리스트</button>
	</c:if>
	
	<form name="bbsForm" id="bbsForm" method="post">
		<input type="hidden" id="commuIdk" name="commuIdk" value="${commuIdk}" />
		<input type="hidden" name="curPage" value="${curPage}"/>
		<input type="hidden" name="searchType" value="${searchType}" />
		<input type="hidden" name="searchValue" value="${searchValue}" />
		<input type="hidden" name="sortType" value="${sortType}" />
	</form>


<!-- Team End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

</body>

</html>