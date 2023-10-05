<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%
   // 개행문자 값을 저장한다.
   pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">
$(document).ready(function() {

   $("#btnList").on("click", function() {
		document.bbsForm.action = "/cs/announce";
		document.bbsForm.submit();
   });
 

});
</script>
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
  background-color: #9E0E0B; /* 배경색 */
  color: white; /* 텍스트 색상 */
  border: none; /* 테두리 제거 */
  border-radius: 5px; /* 둥근 테두리 */
  padding: 10px 20px; /* 안쪽 여백 */
  font-size: 16px; /* 글꼴 크기 */
  cursor: pointer; /* 포인터 커서 */
  transition: background-color 0.3s ease; /* 배경색 전환 효과 */
}

.custom-button:hover {
  background-color: #9E0E0B; /* 마우스 오버 시 배경색 변경 */
}
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<hr>
<div class="container1">
   <div class="row" style="margin-right:0; margin-left:0;">
      <table class="table">
         <thead>
            <tr  class="custom-bg-color">
               <th scope="col" style="width:60%">
                  <h2><c:out value="${cs.noticeTitle}" /></h2>
                   ${cs.regDate}
                  &nbsp;&nbsp;&nbsp;
                
               </th>
               
            </tr>
         </thead>
         <tbody>
            <tr>
               <td colspan="2" class="custom-td-style"><c:out value="${cs.noticeContent}" /></td>
            </tr>
         </tbody>
         <tfoot>
   
         </tfoot>
      </table>
   </div>
   
   <button type="button" id="btnList" class="btn custom-button">리스트</button>


   <br/>
   <br/>
</div>

<form name="bbsForm" id="bbsForm" method="post">
   <input type="hidden" name="hiBbsSeq" value="${noticeIdk}" />
   <input type="hidden" name="searchType" value="${searchType}" />
   <input type="hidden" name="searchValue" value="${searchValue}" />
   <input type="hidden" name="curPage" value="${curPage}" />
</form>

</body>
</html>