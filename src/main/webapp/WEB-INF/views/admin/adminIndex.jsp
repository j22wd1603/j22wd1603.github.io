<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
    <style>
        /* 스타일을 원하시는 대로 수정하세요 */
        iframe {
            width: 100%; /* 아이프레임의 가로 폭을 100%로 설정하여 부모 컨테이너에 맞게 설정 */
            height: 700px; /* 아이프레임의 세로 높이를 원하시는 대로 설정 */
            border: none; /* 아이프레임의 테두리 제거 */
        }
    </style>
<script>
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
<div id="wrapper">

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-cloumn">
	<%@include file="sidebar.jsp" %>
		<!-- Main Content -->
		<div id="content">
		<%@include file="topbar.jsp" %>
			<!-- Begin Page Content -->
			<div class="container-fluid">
				<!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <iframe src="/admin/adminUser" id="adminFrame" frameborder="0" scrolling="auto"></iframe>
                </div>
			</div>
		</div>
	</div>
</div>