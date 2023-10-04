<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

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
                    <h1 class="h3 mb-0 text-gray-800">관리자 메인</h1>
                </div>
			</div>
		</div>
	</div>
</div>