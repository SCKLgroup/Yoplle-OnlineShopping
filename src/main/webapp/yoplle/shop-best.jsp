<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>요리 플러스 레시피 | 요플레</title>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
<jsp:include page="header.jsp" />
    <section class="breadcrumb-section set-bg" data-setbg="img/banner/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>SHOP BEST</h2>
                        <div class="breadcrumb__option">
                            <a href="/web/yoplle/mainPage.do">Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="product spad">
        <div class="container">
               <!--  <div class="col-lg-9 col-xs-7"> -->
					<div class="filter__item">
               <h3 class="product_title grid">상품 베스트 [TOP 20]</h3>
						<div class="filter__option grid">
							
						</div>
					</div>
					<div class="row">
					<c:forEach var="i" items="${probest}" varStatus="cnt" begin="0" end="19">
                        <div class="col-lg-3 col-xs-6 col-xs-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${i.item_img }"
                                onclick="location.href='shopInfo.do?no=${i.item_no}&job=iteminfo'" id="img-href">
                                    <ul class="product__item__pic__hover">
                                        <c:catch>
											<c:choose>
												<c:when test="${id eq null}">
			                                        <li><a href="login.jsp" id="notice"><i class="fa fa-heart"></i></a></li>
			                                        <li><a href="login.jsp" id="notice"><i class="fa fa-shopping-cart"></i></a></li>
												</c:when>
												<c:otherwise>
													<input type="text" id="inputNo" hidden="hidden" value="${i.item_no }">
			                                        <li><a href="rightNow.do" id="wish"><i class="fa fa-heart"></i></a></li>
			                                        <li><a href="rightNow.do" id="cartIn"><i class="fa fa-shopping-cart"></i></a></li>
												</c:otherwise>
											</c:choose>
										</c:catch>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="shopInfo.do?no=${i.item_no}&job=iteminfo">${i.item_name}</a></h6>
                                   	<h5>${i.item_price}&nbsp;원</h5>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        
                        <form id="idCheckSet" method="post" action="rightNow.do">
							<input type="text" name="id" hidden="hidden" value="${id}">
							<input type="text" name="no" id="no" hidden="hidden" value="">
							<input type="text" name="job" id="job"  hidden="hidden" value="">
						</form>
                    </div>
                    <div class="row justify-content-center">
              
                </div>
          </div>
    </section>
    <!-- Product Section End -->

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