<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<head>
    <title>요리 플러스 레시피 | 요플레</title>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<jsp:include page="header.jsp" />
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>주문 완료</h2>
						<!-- <div class="breadcrumb__option">
							<a href="./index.html">메인 페이지로 이동</a>
							<span>Main</span>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Contact Section Begin -->
	<section class="contact spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 text-center"></div>
			</div>
		</div>
	</section>
	<!-- Contact Section End -->


	<!-- Contact Form Begin -->
	<div class="contact-form spad">
		<div class="container">
			<div class="row-jaeil-sign" style="height: 200px;">
				<div class="col-lg-12">
					<div class="confin-content text-center" style="color: blue;">
						<h2 class="mt-3 mb-4">주문이 완료되었습니다.</h2>
						<p>고객님의 집 앞까지 빠르게 전달해 드릴게요.</p>
						<div  style="text-align:center;  margin-top : 7%;">
							 <a href="mainPage.do" class="primary-btn">홈으로</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact Form End -->

	<!-- Footer Section Begin -->
	<jsp:include page="footer.jsp" />
	<!-- Footer Section End -->

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