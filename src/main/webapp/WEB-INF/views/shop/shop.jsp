<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">

 <script src="/resources/js/roulette.js"></script>

</head>

<body>
   <header>
   <!--banner -->
      <div class="banner-container">
        <div class="banner">
          <img class="banner-images" src="/resources/images/product/big/shopbanner3.jpg">
          <img class="banner-images" src="/resources/images/product/big/shopbanner.jpg">
          <img class="banner-images" src="/resources/images/product/big/shopbanner2.jpg">
          <img class="banner-images" src="/resources/images/product/big/shopbanner.jpg">
         </div>
      </div> 
   </header>
   
   
   
   
 <!-- 모달 -->
    <div id="rouletteModal" class="rouletteModal">
        <div class="rouletteModal-content">
          <p>집가고싶다 </p>
            <span class="rouletteModal-close">&times;</span>
            <!-- 룰렛 추가 -->
            <div class="roulette">
                <div class="roulette-bg"><div class="roulette-wacu"></div></div>
                <div class="roulette-arrow"></div>
                <button class="roulette-btn">START</button>
            </div>
        </div>
    </div>



   
  <section>
     <div class="container-xxl py-5">
       <div class="container">
         <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
           <h4 class="section-title2">BEST ITEM</h4>
           <h1 class="display-5 mb-4">TOP 8</h1>
         </div>
         
         <div class="text-center">
           <a href="/shop/bestseller" class="btn btn-primary">View More Products</a>
         </div>
         
         <div class="row g-0 team-items">
                  <c:forEach var="shop" items="${listView}" varStatus="loop">
                     <c:if test="${loop.index < 8}">
                          <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                              <div class="team-item position-relative">
                                  <div class="position-relative">
                                       <a href="/shop/productDetail?productIdk=${shop.productIdk}">
                                  <img class="img-fluid" src="/resources/images/product/small/${shop.productCode}.${shop.productFileExt}" alt="${shop.productName}">
                              </a>
                                  </div>
                                  <div class="bg-light text-center p-4">
                                      <h3 class="mt-2">${shop.productName}</h3>
                                      <span class="text-primary">${shop.productBrandName}</span>
                                  </div>
                              </div>
                          </div>
                    </c:if>
                  </c:forEach>
         </div>
      </div>
     </div>
  </section>

     

  <section>
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h4 class="section-title2">ALL ITEM</h4>
                <h1 class="display-5 mb-4">ALL</h1>
               <form id="bestForm" name="bestForm" action="/shop/shop" method="get">
	              <input type="text" name="productName" class="search-input" placeholder="제품 이름" value="${productName}">
	              <input type="hidden" name="curPage" value="${curPage}">
				  <button type="button" id="buttonA" class="search-button" onclick="search()">검색</button>
            </form>
         </div>
                  
            <div class="row g-0 team-items">
                <c:forEach var="shop" items="${list}">
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item position-relative">
                            <div class="position-relative">
                                <a href="/shop/productDetail?productIdk=${shop.productIdk}">
                                    <img class="img-fluid" src="/resources/images/product/small/${shop.productCode}.${shop.productFileExt}" alt="${shop.productName}">
                                </a>
                            </div>
                            <div class="bg-light text-center p-4">
                                <h3 class="mt-2">${shop.productName}</h3>
                                <span class="text-primary">${shop.productBrandName}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>      
  </section>
  
   <footer>	
	<ul class="pagination justify-content-center">
		<c:if test="${!empty paging}">		
			<c:if test="${paging.prevBlockPage gt 0}">
				<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})">이전블럭</a></li>
			</c:if>
		
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
				<c:choose>
					<c:when test="${i ne curPage}">
						<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item active"><a class="page-link" href="javascript:void(0)" style="cursor:default;">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		
			<c:if test="${paging.nextBlockPage gt 0}">
				<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">다음블럭</a></li>
			</c:if>
		</c:if>
	</ul>
</footer>

 
<script>
      //페이지 로드 시 모달 자동으로 열기
      window.addEventListener("load", function () {
          var modal = document.getElementById("rouletteModal");
          var hasModalBeenOpened = localStorage.getItem("modalOpened");
      
          if (!hasModalBeenOpened) {
              // 모달이 아직 열리지 않았다면 열기
              modal.style.display = "block";
              localStorage.setItem("modalOpened", "true");
          }
      });


     // 모달 닫기 함수
        function closeModal() {
            var modal = document.getElementById("rouletteModal");
            modal.style.display = "none";
        }

        // 모달 닫기 버튼 클릭 이벤트 핸들러
        var closeBtn = document.querySelector(".rouletteModal-close");
        closeBtn.addEventListener("click", closeModal);

        // 모달 바깥 영역 클릭 시 모달 닫기
        window.addEventListener("click", function(event) {
            var modal = document.getElementById("rouletteModal");
            if (event.target == modal) {
                closeModal();
            }
        });
    </script>
    
</body>
</html>