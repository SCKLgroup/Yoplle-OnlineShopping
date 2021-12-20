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
                        <h2>BEST RECIPE</h2>
                        <div class="breadcrumb__option">
                            <a href="/web/yoplle/mainPage.do">Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
               <!--  <div class="col-lg-9 col-xs-7"> -->
					<div class="filter__item">
               <h3 class="product_title grid">레시피 베스트 [TOP 20]</h3>
						<div class="filter__option grid">
							
						</div>
					</div>
					<div class="row">
						<c:forEach var="i" items="${recipeBestList}" varStatus="cnt">
						<c:set var="img" value="${i.rpe_img}" />
						<c:set var="imglist" value="${functions:split(img,'/')}" />
                        <div class="col-lg-3 col-xs-6 col-xs-6">
	                            <div class="product__item">
								<c:catch>
								<c:choose>
									<c:when test="${imglist[1] ne null }">
										<div class="product__item__pic set-bg" data-setbg="${i.rpe_img}"
											OnClick="location.href ='recipeInfo.do?no=${i.rpe_no}&job=recipeinfo'">
											<ul class="product__item__pic__hover">
												<li><a href="#">
														<i class="fa fa-heart"></i>
													</a></li>
											</ul>
										</div>
									</c:when>
									<c:otherwise>
										<div class="product__item__pic set-bg" data-setbg="img/recipe/${i.rpe_img}"
											OnClick="location.href ='recipeInfo.do?no=${i.rpe_no}&job=recipeinfo'">
											<ul class="product__item__pic__hover">
												<li><a href="#">
														<i class="fa fa-heart"></i>
													</a></li>
											</ul>
										</div>

									</c:otherwise>
								</c:choose>
							</c:catch>
	                                <div class="product__item__text">
	                                    <h6><a href="recipeInfo.do?no=${i.rpe_no}&job=recipeinfo">${i.rpe_title}</a></h6>
	                                    <a class="writer" href="#">${i.user_id}</a>
	                                    <div><span>작성일 ${i.rpe_date}</span> <span>&emsp;조회수 ${i.rpe_hit}</span></div>
	                                    <div><i class="fa fa-heart"></i> ${i.rpe_like}</div>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                        
                        <%-- <form id="idCheckSet" method="post" action="rightNow.do">
							<input type="text" name="id" hidden="hidden" value="${id}">
							<input type="text" name="no" id="no" hidden="hidden" value="">
							<input type="text" name="job" id="job"  hidden="hidden" value="">
						</form> --%>
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