<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<style>
*, ::after, ::before {
	box-sizing: unset;
}
.table-hover th, td{
	border: 1px solid #c4c2c2;
	text-align: center;
}
.table-cell {
    max-width: 300px; /* 원하는 최대 길이로 조절하세요 */
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
<script type="text/javascript">
$("document").ready(function(){
	
	$("a[name='userUpdate']").colorbox({
		iframe:true, 
		innerWidth:1235,
		innerHeight:400,
		scrolling:false,
		onComplete:function()
		{
			$("#colorbox").css("width", "1235px");
			$("#colorbox").css("height", "400px");
			$("#colorbox").css("border-radius", "10px");
		}		
	});
});



</script>
</head>
<body>

	<div style="width:90%; margin:auto; margin-top:5rem;">
		<div style="display:flex; margin-bottom:0.8rem;">
			<h2 style="margin-right:auto; color: #525252;">질문관리</h2>

		</div>
		<div>
			<table class="table table-hover" style="border:1px solid #c4c2c2;">
				<thead style="border-bottom: 1px solid #c4c2c2;">
				<tr class="table-thead-main">
					<th style="width: 30px;">글 번호</th>
					<th scope="col" style="width: 50px;">아이디</th>
					<th scope="col" style="width: 100px;">제목</th>
					<th scope="col" style="width: 300px;">내용</th>
					<th scope="col" style="width: 100px;">등록일</th>
				</tr>
				</thead>
				<tbody>
<c:if test="${not empty list}">
        <c:forEach var="list" items="${list}" varStatus="loop">
				<tr>							      
				 <td>${list.questionIdk }</td>
				    <td>${list.userId}</td>
				    <td class="table-cell">${list.questionTitle }</td>
				    <td class="table-cell"><a href="/admin/adminAnswer?questionIdk=${list.questionIdk }">${list.questionContent }</a></td>
				    <td>${list.regDate }</td>
				</tr>
</c:forEach>
</c:if>
<c:if test="${empty list}">

				<tr>
				    <td colspan="5">등록된 질문이 없습니다.</td>
				</tr>	
</c:if>
				</tbody>
			</table>

		</div>
	</div>
</body>
</html>