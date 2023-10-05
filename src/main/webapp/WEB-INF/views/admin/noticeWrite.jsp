<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
   
   $("#btnReply").on("click", function() {
      
      $("#btnReply").prop("disabled", true);  // 답변 버튼 활성화
	  if($.trim($("#noticeTitle").val()).length <= 0)
		  {
		  alert("제목을 입력하세요.");
		  $("#noticeTitle").val("");
		  $("#noticeTitle").focus();
		  return;
		  }
      if($.trim($("#noticeContent").val()).length <= 0)
      {
    	  alert("내용을 입력하세요");
    	  $("#noticeContent").val("");
    	  $("#noticeContent").focus();
    	  return;
      }
      
      var form = $("#replyForm")[0];
      var formData = new FormData(form);
     
      $.ajax({
    	 type:"POST",
    	 enctype:"multipart/form-data",
    	 url:"/admin/noticeProc",
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
    			 alert("등록이 완료되었습니다.");
    			 location.href = "/admin/adminCs";
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
    			 location.href = "/admin/adminCs";
    		 }
    		 else
    	     {
    			 alert("오류가 발생하였습니다.");
    			 $("#btnReply").prop("disabled", false);		//답변 버튼 활성화
    	     }
    	 },
    	 error:function(error)
    	 {
    		 icia.common.error(error);
    		 alert("오류가 발생하였습니다.");
    		 $("#btnReply").prop("disabled",false);
    	 }
      });
      
   });
   
   $("#btnList").on("click", function() {
		document.bbsForm.action ="/admin/adminCs";
		document.bbsForm.submit();
   });
  
});
</script>
</head>
<body>
<div class="container">
   <h2>공지사항 등록</h2>
   <form name="replyForm" id="replyForm" method="post" enctype="multipart/form-data">
      <input type="text" name="noticeTitle" id="noticeTitle" maxlength="100" style="ime-mode:active;" value="" class="form-control mb-2" placeholder="제목을 입력해주세요." required />
      <div class="form-group">
         <textarea class="form-control" rows="10" name="noticeContent" id="noticeContent" style="ime-mode:active;" placeholder="내용을 입력해주세요" required></textarea>
      </div>
   </form>
   
   <div class="form-group row">
      <div class="col-sm-12">
         <button type="button" id="btnReply" class="btn btn-primary" title="답변">등록</button>
         <button type="button" id="btnList" class="btn btn-secondary" title="리스트">리스트</button>
      </div>
   </div>
</div>
</body>
</html>