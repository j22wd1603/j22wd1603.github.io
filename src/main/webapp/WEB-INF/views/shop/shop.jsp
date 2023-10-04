<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">


<script>
function search()
{
	document.shopForm.submit();
}
</script>
<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "04813fae-6608-41f3-9dc9-3287c53485be"
  });
</script>
</head>

<body>
   <header>
   <!--banner -->
      <div class="banner-container">
        <div class="banner">
          <img class="banner-images" src="/resources/images/shop/shopbanner3.jpg">
          <img class="banner-images" src="/resources/images/shop/shopbanner.jpg">
          <img class="banner-images" src="/resources/images/shop/shopbanner2.jpg">
          <img class="banner-images" src="/resources/images/shop/shopbanner.jpg">
         </div>
      </div> 
   </header>
   
   
   
   
 <!-- 모달
    <div id="rouletteModal" class="rouletteModal">
        <div class="rouletteModal-content">
          <p>집가고싶다 </p>
            <span class="rouletteModal-close">&times;</span>
            <!-- 룰렛 추가 -->
         <!--    <div class="roulette">
                <div class="roulette-bg"><div class="roulette-wacu"></div></div>
                <div class="roulette-arrow"></div>
                <button class="roulette-btn">START</button>
            </div>
        </div>
    </div>
 -->
	<section>
		<div class="main_category_direct">
		    <ul class="category_direct_list">
		                    <li class="category_direct_item">
				                <a href="/shop/bestItem">
				                    <img src="/resources/images/shop/best.png" alt="베스트">
				                    <p> 베스트</p>
				                </a>
				            </li>
		                    <li class="category_direct_item">
				                <a href="https://mustit.co.kr/etc/selling_event?click=mainMenu">
				                    <img src="/resources/images/shop/promotion.png" alt="기획전">
				                    <p>기획전</p>
				                </a>
				            </li>
		                   
		                    
		                    <li class="category_direct_item">
				                <a href="https://mustit.co.kr/review/list?list_type=other&amp;click=mainMenu">
				                    <img src="/resources/images/shop/review.png" alt="리뷰">
				                    <p>리뷰</p>
				                 </a>
				            </li>
		                    <li class="category_direct_item">
				                <a href="/community/blog">
				                    <img src="/resources/images/shop/community.png" alt="커뮤니티">
				                    <p>커뮤니티</p>
				                </a>
				            </li>			       
		            </ul>
		</div>
  </section>   
  
  
  <section>
     <div class="container-xxl py-5">
       <div class="container">
         <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
           <h4 class="section-title2">BEST ITEM</h4>
           <h1 class="display-5 mb-4">TOP 8</h1>
         </div>
         
         <div class="text-center">
           <a href="/shop/bestItem" class="btn btn-primary">View More Products</a>
         </div>
         
         <div class="row g-0 team-items">
                  <c:forEach var="shop" items="${listView}" varStatus="loop">
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

     

  <section>
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h4 class="section-title2">ALL ITEM</h4>
                <h1 class="display-5 mb-4">ALL</h1>
            <form id="shopForm" name="shopForm" action="/shop/shop" method="get">
	              <input type="text" id="productName" name="productName" class="search-input" placeholder="제품 이름" value="${productName}">
				  <button type="button" id="buttonA" name="buttonA" class="search-button" onclick="search()">검색</button>
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