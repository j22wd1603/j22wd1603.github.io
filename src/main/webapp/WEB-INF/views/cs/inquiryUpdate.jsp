<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">
$(document).ready(function() {

   $("#questionTitle").focus();
   
   $("#btnUpdate").on("click", function() {
      
	   $("#btnUpdate").prop("disabled", true);		//버튼 비활성화
	   if($.trim($("#questionTitle").val()).length <= 0)
	   {
			alert("제목을 입력하세요");
			$("#questionTitle").val("");
			$("#questionTitle").focus();
			return;
 	   }
	   if($.trim($("#questionContent").val()).length<=0)
	   {
		   alert("내용을 입력하세요");
		   $("#questionContent").val("");
		   $("#questionContent").focus();
		   return;
	   }
	   var fileValue = $('#fileCheckValue').is(':checked');
		if(fileValue)
			document.updateForm.fileDeleteCheck.value = "Y";
	   var form = $("#updateForm")[0];
	   var formData = new FormData(form);
	   
	   $.ajax({
		  type:"POST",
		  enctype:"multipart/form-data",
		  url:"/cs/updateProc",
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
				 alert("게시물이 수정 되었습니다");
				 location.href ="/user/mypageMyQ";
				 /*
				 document.bbsForm.action = "/board/list";
				 document.bbsForm.submit();
				 */
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
				  location.href = "/cs/inquirylist";  
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
			  alert("게시물 수정 중 오류가 발생하였습니다");
			  $("#btnUpdate").prop("disabled", false);		//버튼 활성화
		  }
	   });
   });
   
   $("#btnList").on("click", function() {
		document.bbsForm.action = "/user/mypageMyQ";
		document.bbsForm.submit();
   });


});
</script>
</head>
<body>

<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<div class="container">
   <h2>게시물 수정</h2>
   <form name="updateForm" id="updateForm" method="post" enctype="multipart/form-data">
   <select name="questionCategory" id="questionCategory" class="custom-select" style="width:auto;">
            <option value="">조회 항목</option>
            <option value="1" <c:if test='${searchType eq "1"}'>selected</c:if>>배송</option>
            <option value="2" <c:if test='${searchType eq "2"}'>selected</c:if>>주문/결제</option>
            <option value="3" <c:if test="${searchType eq '3'}">selected</c:if>>취소/교환/환불</option>
            <option value="4" <c:if test="${searchType eq '4'}">selected</c:if>>회원정보</option>
            
         </select>
      <input type="text" name="userName" id="userName" maxlength="20" value="${user.userName}" style="ime-mode:active;" class="form-control mt-4 mb-2" placeholder="이름을 입력해주세요." readonly />
      <input type="text" name="questionTitle" id="questionTitle" maxlength="100" style="ime-mode:active;" value="${question.questionTitle}" class="form-control mb-2" placeholder="제목을 입력해주세요." required />
      <div class="form-group">
         <textarea class="form-control" rows="10" name="questionContent" id="questionContent" style="ime-mode:active;" placeholder="내용을 입력해주세요" required>${question.questionContent}</textarea>
      </div>
      <div class="form-group2">
                <input type="file" id="profilePicture" name="profilePicture" style="margin: 0 auto; display: block;" />
				<input type="button" class="btn" onclick="profilePicture()" style="display: block; margin: 0 auto;" />
                <br>
            </div>
<c:if test="${question.fileCheck eq 'Y'}">
      <div style="margin-bottom:0.3em;">[첨부파일 :${question.questionIdk}.${question.fileExt}]</div>
      <input type="checkbox" id="fileCheckValue" name="fileCheckValue" /> 사진 수정 또는 삭제 여부		
      
</c:if>
      <input type="hidden" name="questionIdk" value="${question.questionIdk}" />
      <input type="hidden" name="searchType" value="${searchType}" />
      <input type="hidden" name="searchValue" value="${searchValue}" />
      <input type="hidden" name="curPage" value="${curPage}" />
      <input type="hidden" name="fileDeleteCheck" value="" />	
      
   </form>
   
   <div class="form-group row">
      <div class="col-sm-12">
      
         <button type="button" id="btnUpdate" class="btn btn-primary" title="수정">수정</button>
         <button type="button" id="btnList" class="btn btn-secondary" title="리스트">리스트</button>
      </div>
   </div>
</div>

<form name="bbsForm" id="bbsForm" method="post">
   <input type="hidden" name="questionIdk" value="${questionIdk}" />
   <input type="hidden" name="searchType" value="${searchType}" />
   <input type="hidden" name="searchValue" value="${searchValue}" />
   <input type="hidden" name="curPage" value="${curPage}" />
</form>

</body>
</html>