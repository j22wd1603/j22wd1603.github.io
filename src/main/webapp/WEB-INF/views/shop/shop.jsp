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
/*채널톡*/
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
        <a href="/user/join">
		    <img class="banner-images" src="/resources/images/shop/shopbanner.jpg">
		</a> 
         <a href="/community/myroom">
		    <img class="banner-images" src="/resources/images/shop/shopbanner3.jpg">
		</a>      
          <a href="/shop/product?shopTabCode=A">
		    <img class="banner-images" src="/resources/images/shop/shopbanner2.jpg">
		</a>
		<a href="#" onclick="rcommend()">
          <img class="banner-images" src="/resources/images/shop/shopbanner4.jpg" id="recommendImage">
        </a>
        </div>
      </div> 
   </header>
   

  <section>
     <div class="container-xxxxl py-7">
       <div class="container">
         <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
           <h4 class="section-title2">BEST ITEM</h4>
           <h1 class="display-5 mb-4">TOP 8</h1>
         </div>
         
         <div class="text-center" style="margin-bottom:30px;">
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
    <div class="container-xxxxl py-7">
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
  
  
  
  <!-- 모달 
  <div id="app"></div>
  <script src="/resources/js/roulette.js"></script>
  -->
<script>
function rcommend() {
	
    $.ajax({
        url: "/shop/recommend",
        method: "GET",
        success: function (data) {
        	alert("추천상품으로 이동합니다.");
        	location.href = "/shop/productDetail?productIdk="+data;
        },
        error: function () {
        	alert("상품 추천 실패했습니다.");
        }
    });
	
}
 </script>
</body>
</html>