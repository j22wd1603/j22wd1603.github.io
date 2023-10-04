<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SideBar</title>
<!-- Custom fonts for this template-->
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

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
			<a class="nav-link collapsed" href="/admin/adminUser" data-toggle="collapse" data-target="#collapseTwo"
			aria-expanded="true" aria-controls="collapseTwo"> <span>유저 관리</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">product</h6>
						<a class="collapse-item" href="admin_product_list">Product List</a> 
						<a class="collapse-item" href="admin_enroll_product">Enroll Product</a>
					</div>
				</div>
		</li>

		<!-- Nav Item - Utilities Collapse Menu -->
		<!-- Order -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="/admin/adminSeller" data-toggle="collapse" data-target="#collapseUtilities"
			aria-expanded="true" aria-controls="collapseUtilities"><span>판매자 관리</span>
			</a>
			<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Order</h6>
					<a class="collapse-item" href="/admin/adminShop">Order Status</a> 
				</div>
			</div>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">게시판 관리</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
			aria-expanded="true" aria-controls="collapsePages"><span>게시물 관리</span>
			</a>
			<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Q & A</h6>
					<a class="collapse-item" href="admin_qna_list_form">Q & A Status</a>
					<div class="collapse-divider"></div>
					<h6 class="collapse-header">Notice</h6>
					<a class="collapse-item" href="admin_write_notice_form">Write Notice</a>
					<a class="collapse-item" href="admin_notice_list">Notice List</a>
				</div>
			</div>
		</li>
		
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMember"
			aria-expanded="true" aria-controls="collapsePages"> <span>댓글, 리뷰 관리</span>
			</a>
			<div id="collapseMember" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Member</h6>
					<a class="collapse-item" href="admin_member_list">Member List</a>
					<div class="collapse-divider"></div>
				</div>
			</div>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">
		
		<!-- Heading -->
		<div class="sidebar-heading">문의 관리</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="/admin/adminCs" data-toggle="collapse" data-target="#collapsePages"
			aria-expanded="true" aria-controls="collapsePages"><span>1대1 문의 관리</span>
			</a>
			<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Q & A</h6>
					<a class="collapse-item" href="admin_qna_list_form">Q & A Status</a>
					<div class="collapse-divider"></div>
					<h6 class="collapse-header">Notice</h6>
					<a class="collapse-item" href="admin_write_notice_form">Write Notice</a>
					<a class="collapse-item" href="admin_notice_list">Notice List</a>
				</div>
			</div>
		</li>
		
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMember"
			aria-expanded="true" aria-controls="collapsePages"> <span>공지사항 등록</span>
			</a>
			<div id="collapseMember" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Member</h6>
					<a class="collapse-item" href="admin_member_list">Member List</a>
					<div class="collapse-divider"></div>
				</div>
			</div>
		</li>
		
		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">
		
		<li class="nav-item">
			<a class="nav-link collapsed" href="/admin/loginOut" data-toggle="collapse" data-target="#collapseMember"
			aria-expanded="true" aria-controls="collapsePages"> <span>로그아웃</span>
			</a>
			<div id="collapseMember" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Member</h6>
					<a class="collapse-item" href="admin_member_list">Member List</a>
					<div class="collapse-divider"></div>
				</div>
			</div>
		</li>
	</ul>
	<!-- End of Sidebar -->