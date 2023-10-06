<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SideBar</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Custom fonts for this template-->
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script>
function openFrame(url) {
	$('#adminFrame').attr('src', url);
}
</script>
</head>
<body>
	<!-- Sidebar -->
	<ul
		class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
		id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center">
			<div class="sidebar-brand-text mx-3">Admin</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item active"><a class="nav-link" href="/admin/adminIndex"><span>관리자 메인</span></a>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">관리</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<!-- Product -->
		<li class="nav-item">
				<a class="nav-link collapsed" onclick="openFrame('/admin/adminCs')" data-toggle="collapse" data-target="#collapseTwo"
				    aria-expanded="true" aria-controls="collapseTwo">
				    <span>유저 관리</span>
				</a>
		</li>
		<!-- Nav Item - Utilities Collapse Menu -->
		<!-- Order 
		<li class="nav-item">
			<a class="nav-link collapsed" onclick="openFrame('/admin/adminSeller')" data-toggle="collapse" data-target="#collapseUtilities"
			aria-expanded="true" aria-controls="collapseUtilities"><span>판매자 관리</span>
			</a>
		</li>
-->
		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">게시판 관리</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" onclick="openFrame('/admin/adminCommunity')" data-toggle="collapse" data-target="#collapsePages"
			aria-expanded="true" aria-controls="collapsePages"><span>게시물 관리</span>
			</a>
		</li>
		
<!--
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMember"
			aria-expanded="true" aria-controls="collapsePages"> <span>댓글, 리뷰 관리</span>
			</a>
		</li>
-->
		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">
		
		<!-- Heading -->
		<div class="sidebar-heading">문의 관리</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" onclick="openFrame('/admin/adminCs')" data-toggle="collapse" data-target="#collapsePages"
			aria-expanded="true" aria-controls="collapsePages"><span>1대1 문의 관리</span>
			</a>
		</li>
		
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" onclick="openFrame('/admin/noticeWrite')" data-toggle="collapse" data-target="#collapseMember"
			aria-expanded="true" aria-controls="collapsePages"> <span>공지사항 등록</span>
			</a>
		</li>
		
		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">
		
		<li class="nav-item">
			<a class="nav-link collapsed" href="/admin/loginOut" data-toggle="collapse" data-target="#collapseMember"
			aria-expanded="true" aria-controls="collapsePages"> <span>로그아웃</span>
			</a>
		</li>
	</ul>
	<!-- End of Sidebar -->