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

function fn_search()
{
	document.searchForm.curPage.value = "1";
	document.searchForm.action = "/user/list";
	document.searchForm.submit();
}

function fn_paging(curPage)
{
	document.searchForm.curPage.value = curPage;
	document.searchForm.action = "/user/list";
	document.searchForm.submit();
}

function fn_pageInit()
{
	$("#searchType option:eq(0)").prop("selected", true);
	$("#searchValue").val("");
	
	fn_search();		
}
</script>
</head>
<body>
	<li>회원</li>
	<div style="width:90%; margin:auto; margin-top:5rem;">
		<div style="display:flex; margin-bottom:0.8rem;">
			<h2 style="margin-right:auto; color: #525252;">회원 리스트</h2>
			<form class="d-flex" name="searchForm" id="searchForm" method="post" style="place-content: flex-end;">
				<select id="status" name="status" style="font-size: 1rem; width: 6rem; height: 3rem;">
					<option value="">상태</option>
					<option value="Y">정상</option>
					<option value="N">정지</option>
				</select>
				<select id="searchType" name="searchType" style="font-size: 1rem; width: 8rem; height: 3rem; margin-left:.5rem; ">
					<option value="">검색타입</option>
					<option value="1">회원아이디</option>
					<option value="2">회원명</option>
				</select>
				<input name="searchValue" id="searchValue" class="form-control me-sm-2" style="width:15rem; margin-left:.5rem;" type="text" value="">
				<a class="btn my-2 my-sm-0" href="javascript:void(0)" onclick="fn_search()" style="width:7rem; margin-left:.5rem; background-color: rgb(239, 239, 239); border-color:rgb(118, 118, 118);">조회</a>
				<input type="hidden" name="curPage" value="" />
			</form>
		</div>
		<div>
			<table class="table table-hover" style="border:1px solid #c4c2c2;">
				<thead style="border-bottom: 1px solid #c4c2c2;">
				<tr class="table-thead-main">
					<th scope="col" style="width:15%;">아이디</th>
					<th scope="col">이름</th>
					<th scope="col">이메일</th>
					<th scope="col">상태</th>
					<th scope="col">등록일</th>
				</tr>
				</thead>
				<tbody>

				<tr>
				    <th scope="row" class="table-thead-sub" style="border: 1px solid #c4c2c2;"><a href="/user/update?userId=아이디" name="userUpdate">아아디</a></th>
				    <td>이름</td>
				    <td>이메일</td>
				    <td>정상</td>
				    <td>날짜</td>
				</tr>


				<tr>
				    <td colspan="5">등록된 회원정보가 없습니다.</td>
				</tr>	

				</tbody>
			</table>
			<div class="paging-right" style="float:right;">
				<!-- 페이징 샘플 시작 -->
					<!--  이전 블럭 시작 -->

						<a href="javascript:void(0)"  class="btn2 btn-primary" onclick="fn_paging(1)"  title="이전 블럭">&laquo;</a>

					<!--  이전 블럭 종료 -->
					<span>
					<!-- 페이지 시작 -->

								<a href="javascript:void(0)" class="btn2 btn-primary" onclick="fn_paging(1)" style="font-size:14px;">1</a>

								<h class="btn2 btn-primary" style="font-size:14px; font-weight:bold;">2</h>

					<!-- 페이지 종료 -->
					</span>
					<!--  다음 블럭 시작 -->
			
						<a href="javascript:void(0)" class="btn2 btn-primary" onclick="fn_paging(22)" title="다음 블럭">&raquo;</a>

					<!--  다음 블럭 종료 -->

				<!-- 페이징 샘플 종료 -->
			</div>
		</div>
	</div>
</body>
</html>