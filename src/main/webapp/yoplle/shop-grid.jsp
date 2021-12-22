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
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/banner/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>YOPLLE SHOP</h2>
                        <div class="breadcrumb__option">
                            <a href="/web/yoplle/mainPage.do">Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
        	<!-- 정렬 -->
			<div class="filter__item">
        		<h3 class="product_title grid"><c:out value="${itemList['0'].item_category}"/></h3>
				<div class="filter__option grid">
					<span OnClick="location.href='itemList.do?category=${pageList.category}&page=1&sort=lastest'">신상품순</span> 
					<span OnClick="location.href='itemList.do?category=${pageList.category}&page=1&sort=orderVolume'">판매량순</span>
					<span OnClick="location.href='itemList.do?category=${pageList.category}&page=1&sort=lowCost'">낮은 가격순</span>
					<span OnClick="location.href='itemList.do?category=${pageList.category}&page=1&sort=highCost'">높은 가격순</span>
				</div>
			</div>
			<!-- 상품 정보 출력 -->
			<div class="row">
				<c:forEach var="i" items="${itemList}" varStatus="cnt">
                	<div class="col-lg-3 col-xs-6 col-xs-6">
                    	<div class="product__item">
                        	<div class="product__item__pic set-bg list-bg" data-setbg="${i.item_img }" 
                        		OnClick="location.href='shopInfo.do?no=${i.item_no}&job=iteminfo'" id="img-href"></div>
                            <div class="product__item__text">
	                            <h6><a href="shopInfo.do?no=${i.item_no}&job=iteminfo">${i.item_name}</a></h6>
	                           	<h5>${i.item_price}&nbsp;원</h5>
                            </div>
                        </div>
                   	</div>
                </c:forEach>
            </div>
           <!-- 페이징 -->
            <div class="row justify-content-center">
            	<div class="product__pagination listnum">
                	<c:choose>
						<c:when test="${pageList.startPage==1}">
                      		<a href="itemList.do?category=${pageList.category}&page=${pageList.startPage}&sort=${pageList.sort}"><i class="fa fa-long-arrow-left"></i></a>
						</c:when>
						<c:otherwise>
	                        <a href="itemList.do?category=${pageList.category}&page=${pageList.startPage-10}&sort=${pageList.sort}"><i class="fa fa-long-arrow-left"></i></a>
						</c:otherwise>
					</c:choose>
                    
                    <c:forEach varStatus="cnt" begin="${pageList.startPage}"  end="${pageList.endPage}">
                    	<c:choose>
							<c:when test="${cnt.index eq pageList.page }">
                        		<a href="#" class="current-page">${cnt.index}</a>
							</c:when>
                        	<c:otherwise>
								<a href="itemList.do?category=${pageList.category}&page=${cnt.index}&sort=${pageList.sort}">${cnt.index}</a>
							</c:otherwise>
						</c:choose>
                   </c:forEach>
                       
                   <c:choose>
						<c:when test="${pageList.endPage ne pageList.totalPage}">
	                        <a href="itemList.do?category=${pageList.category}&page=${pageList.endPage+1}&sort=${pageList.sort}"><i class="fa fa-long-arrow-right"></i></a>
						</c:when>
						<c:otherwise>
	                        <a href="itemList.do?category=${pageList.category}&page=${pageList.endPage}&sort=${pageList.sort}"><i class="fa fa-long-arrow-right"></i></a>
						</c:otherwise>
				   </c:choose>
              	</div>
          	</div>
       	</div>
    </section>


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
<script>

</script>


</body>

</html>