<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<link href="/resources/css/shopstyle.css" rel="stylesheet">


<script>

</script>

</head>
<div class="review-body">
    <header>
        <h1 id="review-title">REVIEW</h1>
    </header>
    <main>
        <section class="review-form">
            <h2>리뷰 작성</h2>
            <form id="reviewForm">
                <div class="form-group">
                    <label for="username">ID:</label>
                    <input type="text" id="username" name="username" value="${userId}" readonly>     
                    <label for="productname">제품명:</label>
                    <input type="text" id="productname" name="productname" required value="${productName}" readonly>               
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

			<button type="submit" class="review-button">리뷰 등록</button>

                
            </form>
            <!-- 오류 메시지를 표시할 공간 추가 -->
            <div id="errorMessage" style="color: red;"></div>
        </section>
    </main>
</div>



<script>
$(document).ready(function() {
    // 별점을 클릭했을 때의 처리
    $('.star').click(function() {
        var ratingValue = $(this).data('value');
        $('#rating').val(ratingValue);

       
        $('.star').removeClass('selected');
        $(this).addClass('selected');

        
        $(this).prevAll('.star').addClass('selected');
    });

  
    $('#reviewForm').submit(function(e) {
        e.preventDefault(); // 폼 제출을 중지

        var reviewContent = $('#reviewContent').val();
        var rating = $('#rating').val();

        
        $.ajax({
            type: 'POST',
            url: '/shop/review', 
            data: {
                reviewContent: reviewContent,
                rating: rating 
            },
            success: function(response) {
                if (response.status === 0) {
                    alert('리뷰가 등록되었습니다.');
                } else {
                    alert('리뷰 등록 중 오류가 발생했습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.error('Ajax 요청 오류:', error);
            }
        });
    });
});
</script>

</body>
</html>