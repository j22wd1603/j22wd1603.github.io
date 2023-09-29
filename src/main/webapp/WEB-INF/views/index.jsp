<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
<script>
function fn_view(commuIdk)
{
	document.bbsForm.commuIdk.value = commuIdk;
	document.bbsForm.action = "/community/view";
	document.bbsForm.submit();
}

</script>
<style>

*{
 	font-family: 'Gothic A1', sans-serif;
}

h1{
	font-family: 'Gothic A1', sans-serif;
}

</style>
</head>

<body>

    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border position-relative text-primary" style="width: 6rem; height: 6rem;" role="status"></div>
        <img class="position-absolute top-50 start-50 translate-middle" src="/resources/img/icons/icon-1.png" alt="Icon">
    </div>
    <!-- Spinner End -->

    <%@ include file="/WEB-INF/views/include/navigation.jsp" %>
    


    <!-- Carousel Start -->
    <div class="container-fluid p-0 pb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="owl-carousel header-carousel position-relative">
            <div class="owl-carousel-item position-relative" data-dot="<img src='/resources/img/slide_1.jpg'>">
                <img class="img-fluid" src="/resources/img/slide_1.jpg" alt="">
                <div class="owl-carousel-inner">
                    <div class="container">
                        <div class="row justify-content-start">
                            <div class="col-10 col-lg-8">
                                <h1 class="display-1 text-white animated slideInDown" style="font-family: 'Gothic A1', sans-serif;";>금주의 <br> 베스트 아이템</h1>
                                <p class="fs-5 fw-medium text-white mb-4 pb-3">만명의 유저들이 선택한 이번주 베스트 아이템 가구들을 구경하세요</p>
                                <a href="" class="btn btn-primary py-3 px-5 animated slideInLeft">구경하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="owl-carousel-item position-relative" data-dot="<img src='/resources/img/slide_2.jpg'>">
                <img class="img-fluid" src="/resources/img/slide_2.jpg" alt="">
                <div class="owl-carousel-inner">
                    <div class="container">
                        <div class="row justify-content-start">
                            <div class="col-10 col-lg-8">
                                <h1 class="display-1 text-white animated slideInDown">마이룸 <br> 커뮤니티</h1>
                                <p class="fs-5 fw-medium text-white mb-4 pb-3">나의 방을 유저들에게 자랑하고 금주의 방으로 선정되어 혜택을 누려보세요</p>
                                <a href="/community/myroom" class="btn btn-primary py-3 px-5 animated slideInLeft">자랑하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="owl-carousel-item position-relative" data-dot="<img src='/resources/img/slide_3.jpg'>">
                <img class="img-fluid" src="/resources/img/slide_3.jpg" alt="">
                <div class="owl-carousel-inner">
                    <div class="container">
                        <div class="row justify-content-start">
                            <div class="col-10 col-lg-8">
                                <h1 class="display-1 text-white animated slideInDown">자취생 <br>필수템</h1>
                                <p class="fs-5 fw-medium text-white mb-4 pb-3">자취생들에게 없어서는 안될 필수템들을 모아봤습니다</p>
                                <a href="" class="btn btn-primary py-3 px-5 animated slideInLeft">구경하기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- About Start 
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                    <div class="about-img">
                        <img class="img-fluid" src="/resources/img/about-1.jpg" alt="">
                        <img class="img-fluid" src="/resources/img/about-2.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <h4 class="section-title">About Us</h4>
                    <h1 class="display-5 mb-4">A Creative Architecture Agency For Your Dream Home</h1>
                    <p>Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                    <p class="mb-4">Stet no et lorem dolor et diam, amet duo ut dolore vero eos. No stet est diam rebum amet diam ipsum. Clita clita labore, dolor duo nonumy clita sit at, sed sit sanctus dolor eos.</p>
                    <div class="d-flex align-items-center mb-5">
                        <div class="d-flex flex-shrink-0 align-items-center justify-content-center border border-5 border-primary" style="width: 120px; height: 120px;">
                            <h1 class="display-1 mb-n2" data-toggle="counter-up">25</h1>
                        </div>
                        <div class="ps-4">
                            <h3>Years</h3>
                            <h3>Working</h3>
                            <h3 class="mb-0">Experience</h3>
                        </div>
                    </div>
                    <a class="btn btn-primary py-3 px-5" href="">Read More</a>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Service Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h4 class="section-title">CATEGORY</h4>
                <h1 class="display-5 mb-4">EVERYTHING YOU FIND IS HERE <br> 당신이 원하는 모든 것</h1>
            </div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item d-flex position-relative text-center h-100">
                        <img class="bg-img" src="/resources/img/service-1.jpg" alt="">
                        <div class="service-text p-5">
                            <img class="mb-4" src="/resources/img/icons/icon-5.png" alt="Icon">
                            <h3 class="mb-3">FURNITURE</h3>
                            <p class="mb-4">침대, 책상, 쇼파등의 각종 가구들을 구경해보세요</p>
                            <a class="btn" href="/shop/product?shopTabCode=A"><i class="fa fa-plus text-primary me-3"></i>SEE MORE</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="service-item d-flex position-relative text-center h-100">
                        <img class="bg-img" src="/resources/img/service-2.jpg" alt="">
                        <div class="service-text p-5">
                            <img class="mb-4" src="/resources/img/icons/icon-6.png" alt="Icon">
                            <h3 class="mb-3">ELECTRONICS</h3>
                            <p class="mb-4">나만의 냉장고, TV, 세탁기등의 각종 가전들이 준비되어있습니다</p>
                            <a class="btn" href="/shop/product?shopTabCode=B"><i class="fa fa-plus text-primary me-3"></i>SEE MORE</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="service-item d-flex position-relative text-center h-100">
                        <img class="bg-img" src="/resources/img/service-3.jpg" alt="">
                        <div class="service-text p-5">
                            <img class="mb-4" src="/resources/img/icons/icon-7.png" alt="Icon">
                            <h3 class="mb-3">MyRoom 3D</h3>
                            <p class="mb-4">나만의 방을 미리 꾸며보고 필요한 물품들을 구입해보세요</p>
                            <a class="btn" href=""><i class="fa fa-plus text-primary me-3"></i>SEE MORE</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item d-flex position-relative text-center h-100">
                        <img class="bg-img" src="/resources/img/service-4.jpg" alt="">
                        <div class="service-text p-5">
                            <img class="mb-4" src="/resources/img/icons/icon-8.png" alt="Icon">
                            <h3 class="mb-3">STUFF</h3>
                            <p class="mb-4">조명, 패브릭, 카펫, 디퓨저 등 다양한 잡화들을 한번 구경해보세요</p>
                            <a class="btn" href="/shop/product?shopTabCode=C"><i class="fa fa-plus text-primary me-3"></i>SEE MORE</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="service-item d-flex position-relative text-center h-100">
                        <img class="bg-img" src="/resources/img/service-5.jpg" alt="">
                        <div class="service-text p-5">
                            <img class="mb-4" src="/resources/img/icons/icon-9.png" alt="Icon">
                            <h3 class="mb-3">SHIPPING</h3>
                            <p class="mb-4">나의 배송 정보를 조회하고 문의사항들을 접수합니다</p>
                            <a class="btn" href="/user/mypage"><i class="fa fa-plus text-primary me-3"></i>SEE MORE</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="service-item d-flex position-relative text-center h-100">
                        <img class="bg-img" src="/resources/img/service-6.jpg" alt="">
                        <div class="service-text p-5">
                            <img class="mb-4" src="/resources/img/icons/icon-10.png" alt="Icon">
                            <h3 class="mb-3">COMMUNITY</h3>
                            <p class="mb-4">유저들과 함께 소통하고 자유게시판, 마이룸 커뮤니티등을 자유롭게 이용해보세요</p>
                            <a class="btn" href="/community/blog"><i class="fa fa-plus text-primary me-3"></i>SEE MORE</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service End -->


    <!-- Project Start -->
  <div class="container-xxl py-5">
  <div class="container">
    <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
      <h1 class="display-5 mb-4"><a href="/community/myroom" style="color:black">마이룸 월간베스트</a></h1>
    </div>
    <div class="row g-0 team-items">
      <c:forEach var="commuBoard" items="${list1}" varStatus="status">
      
      	<c:if test="${commuBoard.commuStatus eq 'Y'}">	
	        <c:if test="${commuBoard.fileCheck eq 'Y'}">
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
		                <img class="img-fluid" src="/resources/images/community/${commuBoard.commuIdk}.${commuBoard.fileExt}">
		              </div>
		              <div class="bg-light text-center p-4">
		                <h3 class="mt-2">${commuBoard.commuTitle}</h3>
		                <h3 class="mt-2">${commuBoard.regDate}</h3>
		                <h3 class="mt-2">${commuBoard.userId}</h3>
		                <span class="text-primary">조회수: ${commuBoard.commuViews}</span>
		                <span class="text-primary">좋아요수: ${commuBoard.commuLikes}</span>
		              </div>
	              	</a>
	            </div>
	          </div>
	        </c:if>
	        <c:if test="${commuBoard.fileCheck ne 'Y'}">
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
			                <img class="img-fluid" src="/resources/images/community/default.jpg">
		              </div>
		              <div class="bg-light text-center p-4">
		                <h3 class="mt-2">${commuBoard.commuTitle}</h3>
		                <h3 class="mt-2">${commuBoard.regDate}</h3>
		                <h3 class="mt-2">${commuBoard.userId}</h3>
		                <span class="text-primary">조회수: ${commuBoard.commuViews}</span>
		                <span class="text-primary">좋아요수: ${commuBoard.commuLikes}</span>
		              </div>
	              	</a>
	            </div>
	          </div>
	        </c:if>	
        </c:if>
        
      	<c:if test="${commuBoard.commuStatus eq 'N'}">	
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
					<a href="javascript:void(0)" onclick="fn_view(${commuBoard.commuIdk})">
		              <div class="position-relative">
			                <img class="img-fluid" src="/resources/images/community/delete.jpg">
		              </div>
		              <div class="bg-light text-center p-4">
		                <h3 class="mt-2">운영정책에 의해 삭제된 게시물입니다.</h3>
		              </div>
	              	</a>
	            </div>
	          </div>
        </c:if>        
      </c:forEach>
    </div>
  </div>
</div>

    <!-- Project End -->

    <!-- Team Start -->
   <div class="container-xxl py-5">
  <div class="container">
    <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
      <h1 class="display-5 mb-4"><a href="/shop/bestItem" style="color:black">베스트 아이템</a></h1>
    </div>
    <div class="row g-0 team-items">
      <c:forEach var="shop" items="${listView}" varStatus="status">
      
	          <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">  
	            <div class="team-item position-relative">  
	                  <a href="/shop/productDetail?productIdk=${shop.productIdk}">
		              <div class="position-relative">
	                                 <a href="/shop/productDetail?productIdk=${shop.productIdk}">
									    <img class="img-fluid" src="/resources/images/product/small/${shop.productCode}.${shop.productFileExt}" alt="${shop.productName}">
									</a>
	                            </div>
		              <div class="bg-light text-center p-4">
	                                <h3 class="mt-2">${shop.productName}</h3>
	                                <span class="text-primary">${shop.productBrandName}</span>
	                            </div>
	              	</a>
	            </div>
	          </div>
	  
         
      </c:forEach>
    </div>
  </div>
</div>
    <!-- Team End -->

 <!-- Facts Start -->
    <div class="container-xxl py-5">
        <div class="container pt-5">
           <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h4 class="section-title">BENEFITS</h4>
                <h1 class="display-5 mb-4">SWEETHOME<br>사용해야하는 이유</h1>
            </div><br>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="fact-item text-center bg-light h-100 p-5 pt-0">
                        <div class="fact-icon">
                            <img src="/resources/img/icons/icon-2.png" alt="Icon">
                        </div>
                        <h3 class="mb-3">가제</h3>
                        <p class="mb-0">가제</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="fact-item text-center bg-light h-100 p-5 pt-0">
                        <div class="fact-icon">
                            <img src="/resources/img/icons/icon-3.png" alt="Icon">
                        </div>
                        <h3 class="mb-3">FLUENT RESPONSE</h3>
                        <p class="mb-0">고객의 문의와 의견을 <br><b>적극 반영하여</b> <br>끊임없이 유동적으로 개선합니다.</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="fact-item text-center bg-light h-100 p-5 pt-0">
                        <div class="fact-icon">
                            <img src="/resources/img/icons/icon-4.png" alt="Icon">
                        </div>
                        <h3 class="mb-3">BEST FURNITURES</h3>
                        <p class="mb-0">20여개의 브랜드 가구를 <br><b>유저들의 실사용 평가로 엄선하여</b> <br>최상의 제품을 제공합니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Facts End -->

    <!-- Testimonial Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h4 class="section-title">REVIEW</h4>
                <h1 class="display-5 mb-4">유저평</h1>
            </div>
            <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="testimonial-item text-center" data-dot="<img class='img-fluid' src='/resources/img/testimonial-1.jpg' alt=''>">
                    <p class="fs-5">내가 원하는 가구들이 깔끔하게 정리되어 있고, 가구들을 구입하기 전 미리 방을 꾸며 볼 수 있어서 정말 유용한 쇼핑 사이트입니다!</p>
                    <h3>ABC</h3>
                    <span class="text-primary">직장인</span>
                </div>
                <div class="testimonial-item text-center" data-dot="<img class='img-fluid' src='/resources/img/testimonial-2.jpg' alt=''>">
                    <p class="fs-5">내가 원하는 가구들이 깔끔하게 정리되어 있고, 가구들을 구입하기 전 미리 방을 꾸며 볼 수 있어서 정말 유용한 쇼핑 사이트입니다!</p>
                    <h3>AABC</h3>
                    <span class="text-primary">학생</span>
                </div>
                <div class="testimonial-item text-center" data-dot="<img class='img-fluid' src='/resources/img/testimonial-3.jpg' alt=''>">
                    <p class="fs-5">내가 원하는 가구들이 깔끔하게 정리되어 있고, 가구들을 구입하기 전 미리 방을 꾸며 볼 수 있어서 정말 유용한 쇼핑 사이트입니다!</p>
                    <h3>ABCBC</h3>
                    <span class="text-primary">주부</span>
                </div>
            </div>      
        </div>
    </div>
    <!-- Testimonial End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

   <!-- Template Javascript -->
   <script src="/resources/js/main.js"></script>
</body>

</html>