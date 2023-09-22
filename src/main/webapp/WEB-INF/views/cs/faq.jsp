<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<link href="/resources/css/csstyle.css" rel="stylesheet">

<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a> Home <i
			class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <a class="stext-109 cl8 hov-cl1 trans-04">
			My Page <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a> <span class="stext-109 cl4"> My QnA </span>
	</div>
</div>

<!-- 주문상세 시작 -->

<script type="text/javascript">
	function addtag() {
		var html = 
			"<tr>" + 
			"<td scope='row'></td>" + 
			"<td scope='row'><div class='tb-center'></div></td>" +
			"<td scope='row'><div class='tb-center'></div></td>" +
			"<td scope='row'><div class='tb-center'></div></td>" +
			"</tr>";
	}
</script>


<div id="contentWrapper">
	<div id="contentWrap">

		<div id="aside">
			<h2 class="aside-tit">MY QnA</h2>
			<div class="lnb-wrap">
				<div class="lnb-bx">
					<h2 class="txt txt1">SHOPPING INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first">주문내역</li>
							<li>내가 찜한 상품</a></li>
							<li>내가 쓴 리뷰</a></li>
							<li>상품 QnA</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt2">COMMUNITY INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first">내 게시글 보기</a></li>
							<li>내 북마크</a></li>
							<li>내가 쓴 댓글</a></li>
						</ul>
					</div>
				</div>
				<div class="lnb-bx">
					<h2 class="txt txt3">CUSTOMER INFO</h2>
					<div class="lnb">
						<ul>
							<li class="first"><a href="MemberModifyForm.mo">회원정보변경</a></li>
							<li><a href="MyAddress.ad">배송지 관리</a></li>
							<li><a href="MemberDeleteForm.mo">회원탈퇴신청</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- .lnb-wrap -->
		</div>
		<!-- #aside -->
		<hr>
		<div id="content">
			<div id="myOrder">
				<div class="tit-page-2">
					<h2>나의 상품 문의글</h2>
				</div>
				<div class="page-body">
					<div class="table-d2-list">
						<table>
							<colgroup>
								<col width="100">
								<col width="*">
								<col width="200">
								<col width="100">
							</colgroup>
							<tbody>
								
								<tr>
									<td colspan="4" style="padding: 50px 20px; text-align: center; font-size: 15px;">
										<span>작성하신 문의글이 없습니다.</span>

									</td>
								</tr>
								
											<tr>
												<td scope="row"><div class="tb-center">11</div></td>
												<td scope="row"><div class="tb-center">1</div></td>
												<td scope="row"><div class="tb-center">1</div></td>
												<td scope="row"><div class="tb-center">1</div></td>
											</tr>
											

							</tbody>
						</table>
					</div>
					<!-- 하단 여백 -->
					<div style="height: 150px"></div>

				</div>
				<!-- .page-body -->
			</div>
			<!-- #myOrder -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>


<!-- 주문상세 끝 -->