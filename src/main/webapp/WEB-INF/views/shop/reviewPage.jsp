<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">


<script>

</script>

</head>
<body>
<div class="review-body">
    <header>
        <h1 id="review-title">REVIEW</h1>
    </header>
    <main>
        <section class="review-form">
            <h2>리뷰 작성</h2>
                 <div class="form-group">
                    제품명: <p>${product.productName}</p>              
                </div>
		    <div class="form-group">
			    <div class="star_rating">
				    <span class="star" data-value="1">&#9733;</span>
				    <span class="star" data-value="2">&#9733;</span>
				    <span class="star" data-value="3">&#9733;</span>
				    <span class="star" data-value="4">&#9733;</span>
				    <span class="star" data-value="5">&#9733;</span>
				</div>
			    <label for="review">리뷰 내용:</label>
			    <input type="text" id="reviewContent" name="reviewContent" placeholder="리뷰 내용" required>
			</div>

			<button type="button" id="btnReview" class="review-button">리뷰 등록</button>

            <!-- 오류 메시지를 표시할 공간 추가 -->
            <div id="errorMessage" style="color: red;"></div>
        </section>
    </main>
</div>

 <form name="reviewForm" id="reviewForm">
      <input type="hidden" name="productIdk" id="productIdk" value="${productIdk}" />
      <input type="hidden" name="orderDetailIdk" id="orderDetailIdk" value="${detailIdk}" />
      <input type="hidden" name="score" id="score" value="" />
</form>

<script>
$(document).ready(function() {
    // 별점을 클릭했을 때의 처리
    $('.star').click(function() {
        var ratingValue = $(this).data('value');
        $('#rating').val(ratingValue);

       
        $('.star').removeClass('selected');
        $(this).addClass('selected');

        
        $(this).prevAll('.star').addClass('selected');
        $("#score").val($(this).data('value'));

    });

  
    $("#btnReview").on("click", function() {
        $.ajax({
            type: 'POST',
            url: '/shop/reviewInsert', 
            data: {
            	productIdk: $("#productIdk").val(),
            	orderDetailIdk: $("#orderDetailIdk").val(),
            	reviewContent: $("#reviewContent").val(),
            	score: $("#score").val()
            },
            dataType: "json",
            success: function(response) {
                if (response.code == 0) {
                    alert('리뷰가 등록되었습니다.');
                    window.close();
                    window.opener.location.reload()
                } else {
                    alert('리뷰 등록 중 오류가 발생했습니다.');
                }
            },
            error: function(error) {
                console.error('Ajax 에러:', error);
                //icia.common.error(error);
            }
        });
        
    });
});
</script>

</body>
</html>