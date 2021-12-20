<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" >
<head>
    <title>요리 플러스 레시피 | 요플레</title>
  <meta charset="UTF-8">
	<link rel="stylesheet" href="css/eventstyle.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
	<link rel="stylesheet" href="css/slidestyle.css">
	<link rel="stylesheet" href="css/replystyle.css">
</head>
<section>
<body>
	<jsp:include page="header.jsp" />       
		<div class="eventstyle">
			<div id="event-1">
					<a href="event-detail2.jsp">
					<img src="img/banner/event1.png" width=900px alt="" "></a>
					<div class="blog-item-content">
					<span class="text-black text-capitalize mr-1"><i class="icofont-calendar mr-1"></i> 15th November</span>
					</div>				
				<div id="event-title"><a href="event-detail2.jsp">요플레 오픈 기념 20%할인 이벤트!</a></div>
				<p>구매확정 후 3일이내 지급</p>
			</div>
		</div>
		
				<div class="eventstyle">
			<div id="event-1">
					<a href="event-detail1.jsp">
					<img src="img/banner/event2.png" width=900px alt="" "></a>
					<div class="blog-item-content">
					<span class="text-black text-capitalize mr-1"><i class="icofont-calendar mr-1"></i> 20th November</span>
					</div>				
				<div id="event-title"><a href="event-detail1.jsp">신선한 제철 과일 최대 20% 쿠폰 지급</a></div>
				<p>해당 쿠폰은 중복적용이 가능합니다.</p>
			</div>
		</div>
		
				<div class="eventstyle">
			<div id="event-1">
					<img src="img/banner/event3.png" width=900px alt="" ">
					<div class="blog-item-content">
					<span class="text-black text-capitalize mr-1"><i class="icofont-calendar mr-1"></i> 20th November</span>
					</div>				
				<div id="event-title"><a href="">프리미엄 육류 대상 후기 이벤트</a></div>
				<p>아메리카노 쿠폰 및 각종 사은품 증정</p>
			</div>
		</div>
		
			<div class="eventstyle">
			<div id="event-1">
					<img src="img/banner/event4.png" width=900px alt="" ">
					<div class="blog-item-content">
					<span class="text-black text-capitalize mr-1"><i class="icofont-calendar mr-1"></i> 22th November</span>
					</div>				
				<div id="event-title"><a href="">요리 + 레시피 ! 네이버 라이브 방송 실시간 할인</a></div>
				<p>방송 중 공개되는 할인 코드를 이용하여 쿠폰을 지급받을 수 있습니다.</p>
			</div>
		</div>
		
</section>

    <!-- Product Section Enzd -->

	<jsp:include page="footer.jsp" />

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>



</body>

</html>