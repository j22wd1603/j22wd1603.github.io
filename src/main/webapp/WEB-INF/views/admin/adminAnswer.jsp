<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%
   // 개행문자 값을 저장한다.
   pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>

<style>
.custom-pre-style {
    /* 여기에 원하는 스타일을 추가하세요 */
    height: 200px;
    max-height: none;
    overflow: auto;
    
}
.custom-td-style {
    height: 300px; /* 원하는 높이 값으로 변경 */
}

.container1{
	max-width: 720px;
	margin: 0 auto;
}
.custom-bg-color {
    background-color: white; /* 배경색 설정 (예: 회색) */
}
.custom-button {
  background-color: #B78D65; /* 배경색 */
  color: white; /* 텍스트 색상 */
  border: none; /* 테두리 제거 */
  border-radius: 5px; /* 둥근 테두리 */
  padding: 10px 20px; /* 안쪽 여백 */
  font-size: 16px; /* 글꼴 크기 */
  cursor: pointer; /* 포인터 커서 */
  transition: background-color 0.3s ease; /* 배경색 전환 효과 */
}

.custom-button:hover {
  background-color: #B78D65; /* 마우스 오버 시 배경색 변경 */
}
</style>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/adminNavigation.jsp" %>

<script type="text/javascript">
$(document).ready(function() {

   $("#btnList").on("click", function() {
		document.bbsForm.action = "/admin/adminCs";
		document.bbsForm.submit();
   });
   
   $("#btnReply").on("click", function() {
		document.bbsForm.action = "/admin/adminReply";
		document.bbsForm.submit();
   });

   
});
</script>
</head>
<body>

<div class="container1">
</br>   
   <div class="row" style="margin-right:0; margin-left:0;">
      <table class="table">
         <thead>
            <tr class="empty">
               <th scope="col" style="width:60%">
                <h2> ${counsel.questionTitle}</h2>
                                  ${counsel.regDate}
                  
               </th>
               
            </tr>
         </thead>
         
         <tbody>
            <tr hight="40%">
               <td colspan="2" class="custom-td-style" ><pre><c:out value="${counsel.questionContent}" /></pre>
               <c:if test="${counsel.fileCheck eq 'Y'}">
		       <img class="img-fluid" src="/resources/images/question/${questionIdk}.${counsel.fileExt}" style="max-width: 100%; height: auto; display: block; margin: 0 auto; width: 300px; height: 300px;">
				
		    </c:if>
               </td>
            </tr>
         </tbody>

          
         <tfoot>
         
      </table>
      
   </div>

   <button type="button" id="btnList" class="btn btn-secondary">리스트</button>
   <button type="button" id="btnReply" class="btn btn-secondary">답변</button>

   <br/>
   <br/>
   </br>
   	<hr>
   
	</br>
	</br>
<c:if test="${counsel.ansStatus eq 'Y'}">
<div class="row" style="margin-right:0; margin-left:0;">
      <table class="table">
         <thead>
            <tr class="empty">
               <th scope="col" style="width:60%">
                 <h2> <c:out value="${answer.ansTitle}" /></h2>
                 ${answer.ansDate}
               </th>
               
            </tr>
         </thead>
         
         <tbody>
            <tr>
               <td colspan="5" class="custom-td-style"><pre><c:out value="${answer.ansContent}" /></pre>
               
               </td>
            </tr>
         </tbody>

          
         <tfoot>
         
      </table>
      
   </div>
</c:if>
</div>


<form name="bbsForm" id="bbsForm" method="post">
   <input type="hidden" name="questionIdk" value="${questionIdk}" />
   <input type="hidden" name="searchType" value="${searchType}" />
   <input type="hidden" name="searchValue" value="${searchValue}" />
   <input type="hidden" name="curPage" value="${curPage}" />
</form>


</body>
</html>