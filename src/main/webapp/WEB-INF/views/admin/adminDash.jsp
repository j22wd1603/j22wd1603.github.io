<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
<title>관리자 페이지</title>
<style>
@charset "utf-8";
 
body {
	background: #F3F5F7;
}
 
 
main {
	width: 90%;
	max-width: 1200px;
	margin: 20px auto 100px;
}
 
section {
	background: #fff;	
	padding: 10px 5px;
	border: 1px solid #E0E5EE;
	margin-bottom: 20px;
}
 
section.detail {
	display: none;
    max-height: 400px;
    overflow-y: auto;
}
 
.today {
	display: flex;
	justify-content: space-between;	
	align-items: center;
}
 
.today #today {
	font-weight: bold;
	margin-left: 10px;
}
 
.sales_today_detail_title {
	margin-bottom: 5px; 
	font-weight: 500;
	display: flex;
	justify-content: space-between;
}
 
.sales_today_detail {
	display: grid;
	grid-template-columns: 3fr 1fr 1fr;
    grid-template-rows: 40px;
}
 
.sales_today_detail > div {
	border: 1px solid #ddd;
	line-height: 40px;
	padding-left: 10px; 
	white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
 
 
section.graph_section {
	overflow-x: auto;	
}
 
section.graph_section::-webkit-scrollbar {
    display: none;
}
 
 
.box {
	min-width: 650px;
}
 
 
main button {
	padding: 5px 10px;
	border-radius: 5px;
	background: #fff;
	border: 1px solid #ccc;
	font-size: 1.2rem;
}
 
main #date {
	padding: 5px 10px;
	border-radius: 5px;
	font-weight: bold;
	border: 1px solid #ccc;
	font-size: 1.2rem;
}
 
main h1 {
	margin: 20px 0;
}
 
main .graph_box {
	position: relative;
	height: 55vh;
}
 
main .graph_box .graph_background {
	position: absolute;
	top: 0;
	width: 100%;
	height: 100%;
	
	display: none; 
	
}
 
main .graph_box .graph_background div {
	height: 20%;
	width: 100%;
	border: 1px solid #ddd;
	border-top: none;
}
 
main .graph_box ul {
	display: flex;
	height: 100%;
}
 
main .graph_box ul li {
	flex: 1;
	margin-right: 5px;
	display: flex;
	align-items: center;
	justify-content: end;
	flex-direction: column;
}
 
main .graph_box .graph {
	width: 30%;
	min-height: 3px;
	background: green;
	z-index: 1;
	border-radius: 5px 5px 0 0;
	position: relative;
	transition: 0.1s;
	cursor: pointer;
}
 
main .graph_box .graph:hover {
    transform: scaleX(1.2);
    background: red;
}
 
main .graph_box .sales {
	font-size: 1.15rem;
}
 
main .graph_box .graph_date {
	font-size: 1.15rem;
}
 
 
 
@media ( max-width :1250px) {
	#tab {
		width: 100%;
	}
}
 
@media ( max-width :1024px) {
	section.tab {
		margin-top: 0px;
		display: none;
	}
	.tab .box {
		display: block;
	}
	header .admin_page_btn {
		display: none;
	}
	header .menu_tab {
		display: block;
	}
}
 
@media ( max-width :767px) {
	main {
		width: 95%;
	}
	section.tab ul li {
		font-size: 16px;
		height: 50px;
	}
	section.tab ul li a {
		line-height: 50px;
	}
}
 
@media ( max-width :480px) {
	main {
		width: 100%;
	}
	
	
}
</style>


<script>
$(document).ready(function(){

})

</script>
</head>  
    
	<main>
		<section>
  			<div class="today">
  				<span>
  					<span>매출</span>
  					<span id="today"></span>
  				</span>
  			</div>
  			
  		</section>
  		
		<section class="detail today_detail">
  			<div>
				<h3 class="sales_today_detail_title">
					<span>매출 상세</span>
				</h3>
				
  				<div class="sales_today_detail">
  					<div>메뉴</div>
  					<div>수량</div>
  					<div>가격</div>
  				</div>
  			</div>
  		</section>
	
	
		<section class="graph_section"> 
			<div class="box" style="height: 700px">
			
				<h1>총 합계</h1>
				
				<div>(단위 : 원)</div>
					
					<div><p>총 매출 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${total}" />원</p></div>
				</div>
			
		</section>
  		
	</main>
 
</body>
</html>