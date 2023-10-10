<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    
<script type="text/javascript">
$(document).ready(function() {
    
	$("#hiBbsTitle").focus();
	
	   $("#btnUpdate").on("click", function() {
		   
		   $("#btnUpdate").prop("disabled", true);		//버튼 비활성화
		   
		   if($.trim($("#communityTitle").val()).length <= 0)
		   {
			   alert("제목을 입력하세요.");
			   $("#communityTitle").val("");
			   $("#communityTitle").focus();
			   $("#btnUpdate").prop("disabled", false);		//버튼 활성화
			   return;
		   }
		   
		   if($.trim($("#communityContent").val()).length <= 0)
		   {
			   alert("내용을 입력하세요.");
			   $("#communityContent").val("");
			   $("#communityContent").focus();
			   $("#btnUpdate").prop("disabled", false);		//버튼 활성화
			   return;
		   }
		   
		   var fileValue = $('#fileCheckValue').is(':checked');
		   
			
			if(fileValue)
				document.updateForm.fileDeleteCheck.value = "Y";
			
		   if($("#communityFile").val() != null && fileValue == null)
		   {
			   alert("수정 또는 삭제 하시려면 체크박스에 체크가 필요합니다.");
			   $("#btnUpdate").prop("disabled", false);		//버튼 활성화
			   return;
		   }				

		   var form = $("#updateForm")[0];
		   var formData = new FormData(form);
		   
		   $.ajax({
			   type:"POST",
			   enctype:"multipart/form-data",
			   url:"/community/updateProc",
			   data:formData,
			   processData:false,
			   contentType:false,
			   cache:false,
			   beforeSend:function(xhr)
			   {
				   xhr.setRequestHeader("AJAX", "true");
			   },
			   success:function(response)
			   {
				   if(response.code == 0)
				   {
					   alert("게시물이 수정 되었습니다.");
					   document.bbsForm.action = "/community/view";
					   document.bbsForm.submit();	

				   }
				   else if(response.code == 400)
				   {
					   alert("파라미터 값이 올바르지 않습니다.");
					   $("#btnUpdate").prop("disabled", false);		//버튼 활성화
				   }
				   else if(response.code == 403)
				   {
					   alert("본인 게시물이 아닙니다.");
					   $("#btnUpdate").prop("disabled", false);		//버튼 활성화
				   }
				   else if(response.code == 404)
				   {
					   alert("게시물을 찾을 수 없습니다.");
					   location.href = "/community/blog";
				   }
				   else
				   {
					   alert("게시물 수정 중 오류가 발생하였습니다.");
					   $("#btnUpdate").prop("disabled", false);		//버튼 활성화
				   }
			   },
			   error:function(error)
			   {
				   icia.common.error(error);
				   alert("게시물 수정 중 오류가 발생하였습니다.");
				   $("#btnUpdate").prop("disabled", false);		//버튼 활성화
			   }
			   
		   });
		   
	   });
	
	$("#btnList").on("click", function() {
		document.bbsForm.action = "/community/view";
		document.bbsForm.submit();		   
	});
});
</script>    
    
</head>
<body>

   <%@ include file="/WEB-INF/views/include/navigation.jsp" %>

<div class="container">
	<h2>게시물 수정하기</h2>
	<form name="updateForm" id="updateForm" method="post" enctype="multipart/form-data">

		<select disabled name="commuTab" id=commuTab class="custom-select" style="width:auto;">
            <option value="">게시판 고르기</option>
            <option value="1" <c:if test='${community.commuTab eq "1"}'>selected</c:if>>마이룸 게시판</option>
            <option value="2" <c:if test='${community.commuTab eq "2"}'>selected</c:if>>자유 게시판</option>
            <option value="3" <c:if test="${community.commuTab eq '3'}">selected</c:if>>질문 게시판</option>
         </select>	   
               
         <div>
 			<c:if test="${community.fileCheck eq 'Y'}">
           		<img class="img-fluid" src="/resources/images/community/${community.commuIdk}.${community.fileExt}">
   			</c:if>
   			
 		 </div>			
 		 		
		<input type="text" name="userName" id="userName" maxlength="20" value="${user.userId}" style="ime-mode:active;" class="form-control mt-4 mb-2" placeholder="이름을 입력해주세요." readonly />
		<input type="text" name="communityTitle" id="communityTitle" maxlength="100" value="${community.commuTitle}" style="ime-mode:active;" class="form-control mb-2" placeholder="제목을 입력해주세요." required />
	    <div class="form-group">
	       <textarea class="form-control" rows="10" name="communityContent" id="communityContent" style="ime-mode:active;" placeholder="내용을 입력해주세요" required>${community.commuContent}</textarea>
	    </div>
	    
		 <c:if test="${community.fileCheck eq 'Y'}">
	        <div style="margin-bottom:0.3em;">[첨부파일 : ${community.commuIdk}.${community.fileExt}]</div>
	        <input type="checkbox" id="fileCheckValue" name="fileCheckValue" /> 사진 수정 또는 삭제 여부		
		 </c:if>
		
		<input type="file" id="communityFile" name="communityFile" class="form-control mb-2" placeholder="파일을 선택하세요." required />
		
		<input type="hidden" name="commuIdk" value="${community.commuIdk}" />
		<input type="hidden" name="curPage" value="${curPage}"/>
		<input type="hidden" name="searchType" value="${searchType}" />
		<input type="hidden" name="searchValue" value="${searchValue}" />
		<input type="hidden" name="sortType" value="${sortType}" />		
		<input type="hidden" name="fileDeleteCheck" value="" />	
		
		<div class="form-group row">
			<div class="col-sm-12">
				<button type="button" id="btnUpdate" class="btn btn-primary" title="수정">수정</button>
				<button type="button" id="btnList" class="btn btn-secondary" title="리스트">돌아가기</button>
			</div>
		</div>			
		
	</form>
	
	<form name="bbsForm" id="bbsForm" method="post">
		<input type="hidden" name="commuIdk" value="${community.commuIdk}" />
		<input type="hidden" name="curPage" value="${curPage}"/>
		<input type="hidden" name="searchType" value="${searchType}" />
		<input type="hidden" name="searchValue" value="${searchValue}" />
		<input type="hidden" name="sortType" value="${sortType}" />
	</form>

</div>






</body>
</html>