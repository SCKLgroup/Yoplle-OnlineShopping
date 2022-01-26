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
	<link rel="preconnect" href="https://fonts.googleapis.com"> 
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

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
                        <h2>RECIPE</h2>
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
			<div class="filter__item">
            	<h3 class="product_title grid">레시피</h3>
				<div class="filter__option grid">
					<span OnClick="location.href='recipeList.do?page=1&sort=lastest'">최신순</span> 
					<span OnClick="location.href='recipeList.do?page=1&sort=like'">인기순</span>
				</div>
			</div>
			<div class="row">
				<c:forEach var="i" items="${recipeList}" varStatus="cnt">
					<c:set var="img" value="${i.rpe_img}" />
					<c:set var="imglist" value="${functions:split(img,'/')}" />
                   	<div class="col-lg-3 col-xs-6 col-xs-6">
                    	<div class="product__item">
							<c:catch>
								<c:choose>
									<c:when test="${imglist[1] ne null }">
										<div class="product__item__pic set-bg" data-setbg="${i.rpe_img}"
											OnClick="location.href ='recipeInfo.do?no=${i.rpe_no}&job=recipeinfo'">
										</div>
									</c:when>
									<c:otherwise>
										<div class="product__item__pic set-bg" data-setbg="img/recipe/${i.rpe_img}"
											OnClick="location.href ='recipeInfo.do?no=${i.rpe_no}&job=recipeinfo'">
										</div>
									</c:otherwise>
								</c:choose>
							</c:catch>
	                        <div class="product__item__text">
	                            <h6 class="reptitle"><a href="recipeInfo.do?no=${i.rpe_no}&job=recipeinfo">${i.rpe_title}</a></h6>
	                            <a class="writer" href="#">${i.user_id}</a>
	                            <div><span>&emsp;조회수 ${i.rpe_hit}</span></div>
	                            <div class="reptitle"><i class="fa fa-heart"></i> ${i.rpe_like}</div>
	                            <div><span>작성일 ${i.regdate}</span> </div>
	                        </div>
                   		</div>
                     </div>
               </c:forEach>
            </div>
            
           	<div id="btn-div"><button id="btn-write" type="button" onclick="location.href='recipeMake.jsp'">글작성</button></div>
            <div class="row justify-content-center">
            	<div class="product__pagination listnum">
                	<c:choose>
						<c:when test="${pageList.startPage==1}">
                        	<a href="recipeList.do?page=${pageList.startPage}&sort=${pageList.sort}"><i class="fa fa-long-arrow-left"></i></a>
						</c:when>
						<c:otherwise>
				            <a href="recipeList.do?page=${pageList.startPage-10}&sort=${pageList.sort}"><i class="fa fa-long-arrow-left"></i></a>
						</c:otherwise>
					</c:choose>
	                
	                <c:forEach varStatus="cnt" begin="${pageList.startPage}"  end="${pageList.endPage}">
                        <c:choose>
							<c:when test="${cnt.index eq pageList.page }">
	                        	<a href="#" class="current-page">${cnt.index}</a>
							</c:when>
	                        <c:otherwise>
								<a href="recipeList.do?page=${cnt.index}&sort=${pageList.sort}">${cnt.index}</a>
							</c:otherwise>
						</c:choose>
                    </c:forEach>
	                        
                   	<c:choose>
						<c:when test="${pageList.endPage ne pageList.totalPage}">
	                        <a href="recipeList.do?page=${pageList.endPage+1}&sort=${pageList.sort}"><i class="fa fa-long-arrow-right"></i></a>
						</c:when>
						 <c:otherwise>
	                        <a href="recipeList.do?page=${pageList.endPage}&sort=${pageList.sort}"><i class="fa fa-long-arrow-right"></i></a>
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

</body>

</html>