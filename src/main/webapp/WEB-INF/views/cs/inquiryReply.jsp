<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
<c:choose>
	<c:when test="${empty question}">
	alert("답변할 게시물이 존재하지 않습니다.");
	location.href = "/cs/inquirylist";
	</c:when>
	<c:otherwise>
   $("#ansTitle").focus();
   
   $("#btnReply").on("click", function() {
      
      $("#btnReply").prop("disabled", true);  // 답변 버튼 활성화
	  if($.trim($("#ansTitle").val()).length <= 0)
		  {
		  alert("제목을 입력하세요.");
		  $("#ansTitle").val("");
		  $("#ansTitle").focus();
		  return;
		  }
      if($.trim($("#ansContent").val()).length <= 0)
      {
    	  alert("내용을 입력하세요");
    	  $("#ansContent").val("");
    	  $("#ansContent").focus();
    	  return;
      }
      
      var form = $("#replyForm")[0];
      var formData = new FormData(form);
     
      $.ajax({
    	 type:"POST",
    	 enctype:"multipart/form-data",
    	 url:"/cs/replyProc",
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
    		 if(response.code ==0)
    		{
    			 alert("답변이 완료되었습니다.");
    			 location.href = "/user/mypageMyQ";
    			 /*
    			 document.bbsForm.action = "/board/list";
    			 document.bbsForm.submit();
    			 */
    		}
    		 else if(response.code == 400)
    		 {
    			 alert("파라미터 값이 올바르지 않습니다.");
    			 $("#btnReply").prop("disabled", false);		//답변 버튼 활성화
    		 }
    		 else if(response.code == 404)
    		 {
    			 alert("게시물을 찾을수 없습니다.");
    			 location.href = "/user/mypageMyQ";
    		 }
    		 else
    	     {
    			 alert("게시물 답변 중 오류가 발생하였습니다.");
    			 $("#btnReply").prop("disabled", false);		//답변 버튼 활성화
    	     }
    	 },
    	 error:function(error)
    	 {
    		 icia.common.error(error);
    		 alert("게시물 답변 중 오류가 발생하였습니다.");
    		 $("#btnReply").prop("disabled",false);
    	 }
      });
      
   });
   
   $("#btnList").on("click", function() {
		document.bbsForm.action ="/user/mypageMyQ";
		document.bbsForm.submit();
   });
   </c:otherwise>
</c:choose>   
});
</script>
</head>
<body>

<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<div class="container">
   <h2>게시물 답변</h2>
   <form name="replyForm" id="replyForm" method="post" enctype="multipart/form-data">
      <input type="text" name="ansTitle" id="ansTitle" maxlength="100" style="ime-mode:active;" value="" class="form-control mb-2" placeholder="제목을 입력해주세요." required />
      <div class="form-group">
         <textarea class="form-control" rows="10" name="ansContent" id="ansContent" style="ime-mode:active;" placeholder="내용을 입력해주세요" required></textarea>
      </div>
      <input type="hidden" name="questionIdk" value="${question.questionIdk}" />
   </form>
   
   <div class="form-group row">
      <div class="col-sm-12">
         <button type="button" id="btnReply" class="btn btn-primary" title="답변">답변</button>
         <button type="button" id="btnList" class="btn btn-secondary" title="리스트">리스트</button>
      </div>
   </div>
</div>
<form name="bbsForm" id="bbsForm" method="post">
   <input type="hidden" name="questionIdk" value="${question.questionIdk}" />
   <input type="hidden" name="searchType" value="${searchType}" />
   <input type="hidden" name="searchValue" value="${searchValue}" />
   <input type="hidden" name="curPage" value="${curPage}" />
</form> 

</body>
</html>