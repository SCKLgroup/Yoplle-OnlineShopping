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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<!-- Page Preloder -->
	<jsp:include page="header.jsp" />
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2 class="jaeil_category_title">Wish List</h2>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">
						<table>
							<thead>
								<tr>
									<th style="width: 15%;" >전체선택 &nbsp;<input type="checkbox" ></th>
									<th class="shoping__product" style="width: 40%;" >상품</th>
									<th style="width: 5%;" ></th>
									<th style="width: 15%;" >가격</th>
									<!-- <th>수량</th>
									<th>총 금액</th> -->
									<th style="width: 10%;">취소</th>
									<th style="width: 10%;" >담기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td class="shoping__cart__item"><img src="img/cart/cart-1.jpg" alt="">
										<h5>[돼지고기] 국내산 삼겹살 380g</h5></td>
									<td>
										<button class="btn-none-back">
											<i class="fa fa-heart" style="color: #6bbbff"></i>
										</button>
									</td>
									<td class="shoping__cart__price">23,000원</td>
									<!-- <td class="shoping__cart__quantity">
										<div class="quantity">
											<div class="pro-qty">
												<input type="text" value="1">
											</div>
										</div>
									</td>
									<td class="shoping__cart__total">23,000원</td> -->
									<div>
									<td class="shoping__cart__item__close"><span class="icon_close"></span></td>
									<td><a href="#">Ｖ</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td class="shoping__cart__item"><img src="img/cart/cart-2.jpg" alt="">
										<h5>[야채] 루꼴라 380g</h5></td>
									<td>
										<button class="btn-none-back">
											<i class="fa fa-heart" style="color: #6bbbff"></i>
										</button>
									</td>
									<td class="shoping__cart__price">13,000원</td>
								<!-- 	<td class="shoping__cart__quantity">
										<div class="quantity">
											<div class="pro-qty">
												<input type="text" value="1">
											</div>
										</div>
									</td>
									<td class="shoping__cart__total">13,000원</td> -->
									<td class="shoping__cart__item__close"><span class="icon_close"></span></td>
									<td><a href="#">Ｖ</a></td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td class="shoping__cart__item"><img src="img/cart/cart-3.jpg" alt="">
										<h5>[과일] 바나나 380g</h5></td>
									<td>
										<button class="btn-none-back">
											<i class="fa fa-heart" style="color: #6bbbff"></i>
										</button>
									</td>
									<td class="shoping__cart__price">6,900원</td>
									<!-- <td class="shoping__cart__quantity">
										<div class="quantity">
											<div class="pro-qty">
												<input type="text" value="1">
											</div>
										</div>
									</td>
									<td class="shoping__cart__total">6,900원</td> -->
									<td class="shoping__cart__item__close"><span class="icon_close"></span></td>
									<td><a href="#">Ｖ</a></td>
								</tr>
								
								
							</tbody>
						</table>
									<div  style="text-align: right; margin-top: 10%;">
										 <a href="shoping-cart.jsp" class="primary-btn">장바구니에 담기</a>
									</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shoping Cart Section End -->

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