<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">
<script>
function sendSpeech() {
	var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
	var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;
	var SpeechRecognitionEvent = SpeechRecognitionEvent || webkitSpeechRecognitionEvent;
	
	var productNameInput = document.getElementById('productName');
	var recognition = new SpeechRecognition();
	var speechRecognitionList = new SpeechGrammarList();
	
	recognition.grammars = speechRecognitionList;
	recognition.lang = 'ko-KR';
	recognition.interimResults = false; // true: 중간 결과를 반환, false: 최종 결과만 반환
	recognition.continious = false; // true: 음성인식을 계속해서 수행, false: 음성인식을 한번만 수행
	recognition.maxAlternatives = 1; // 신뢰성 제일높은거 1개만
	
	recognition.start();
	
	recognition.onresult = function(event) {
		var speechResult = event.results[0][0].transcript.toLowerCase();
		console.log('Confidence: ' + event.results[0][0].confidence);
		console.log('Speech Result: ' + speechResult);
		productNameInput.value = speechResult;
		document.bestForm.submit();
	}
	
	recognition.onend = function(event) {
		console.log('SpeechRecognition.onend');
	}
	
	recognition.onnomatch = function(event) {
		console.log('SpeechRecognition.onnomatch');
	}
	
	recognition.onstart = function(event) {
		console.log('SpeechRecognition.onstart');
	}
}

function fn_list(curPage)
{
	document.bestForm.curPage.value = curPage;
	document.bestForm.submit();
}

function search()
{
	document.bestForm.curPage.value = 1;
	document.bestForm.submit();
}
</script>
</head>

<body>
	<section>
	  <div class="container-xxxxl py-7">
	    <div class="container">
	      <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
	        <h4 class="section-title2">BEST ITEM</h4>
	        <h1 class="display-5 mb-4">BEST</h1>
	            <form id="bestForm" name="bestForm" action="/shop/bestItem" method="get">
				  <input type="text" id="productName" name="productName" class="search-input" placeholder="제품 이름" value="${productName}">
				  <input type="hidden" name="curPage" value="${curPage}">
				  <button type="button" id="buttonA" class="search-button" onclick="search()">검색</button>
				  <button type="button" id="btnVoice" class="search-button" onclick="sendSpeech()">음성</button>
				</form>
			</div>
	      		
	       <div class="row g-0 team-items">
	            <c:forEach var="shop" items="${listView}">
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
				<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})"><i class="fas fa-arrow-left"></i></a></li>
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
				<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})"><i class="fas fa-arrow-right"></i></a></li>
			</c:if>
		</c:if>
	</ul>
</footer>

   

</body>
</html>