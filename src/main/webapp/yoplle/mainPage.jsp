<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
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
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<section class="hero">
	<div class="container">
		<div class="row">


			<div class="text-center" style="width: 100%">
				<div id="carouselExampleCaptions" class="carousel slide" style="height: 450px"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
							class="active" aria-current="true" aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
							aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
							aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="img/banner/banner1.png" style="width: 800px; height: 450px" class="d-block w-100"
								alt="...">
						</div>
						<div class="carousel-item">
							<img src="img/banner/banner2.png" style="height: 450px" class="d-block w-100" alt="...">

						</div>
						<div class="carousel-item">
							<img src="img/banner/banner3.png" style="height: 450px" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	</section>
	<!-- Hero Section End -->

	<!-- Categories Section Begin -->

	<div class="section-title">
		<h2>상품 TOP10</h2>
	</div>
	<section class="categories">
	<div class="container">
		<div class="row">
			<div class="categories__slider owl-carousel">

				<c:forEach var="i" items="${itemBest}" varStatus="cnt">
					<!-- 수정mainBest -->
					<a href="shopInfo.do?no=${i.item_no}&job=iteminfo">
						<div class="col-lg-3">
							<div class="categories__item set-bg">
								<div>
									<h5 style="color: black"></h5>
								</div>
								<img src="${i.item_img}" width="100%" height="100%">
							</div>
							<div style="padding: 10px 0px 10px 0px">
								<h4>${i.item_name}</h4>
							</div>
							<div>
								<h5>${i.item_price}원</h5>
							</div>
						</div>
					</a>

				</c:forEach>


			</div>
		</div>
	</div>
	</section>
	<!-- Categories Section End -->

	<!-- 레시피별 베스트 -->

	<div class="section-title" style="padding: 50px; margin-bottom: 0px">
		<h2>레시피 TOP10</h2>
	</div>

	<section class="categories">
	<div class="container">
		<div class="row">
			<div class="categories__slider owl-carousel">

				<c:forEach var="i" items="${recipeBest}" varStatus="cnt" begin="0" end="9">
					<!-- 수정mainBest -->
					<a href="recipeInfo.do?no=${i.rpe_no}&job=recipeinfo">
						<div class="col-lg-3">
							<div class="categories__item set-bg">
								<div>
									<h5 style="color: black"></h5>
								</div>
								<img src="${i.rpe_img }" width="100%" height="100%">
							</div>
							<div style="padding: 10px 0px 10px 0px">
								<h4>${i.rpe_title}</h4>
							</div>
							<div>
								<h5>${i.user_id}</h5>
							</div>
						</div>
					</a>

				</c:forEach>
			</div>
		</div>
	</div>
	</section>

	<!-- 레시피별 베스트 끝 -->

	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title"><h2>상품 카테고리</h2></div>
					<div class="featured__controls">
						<ul class="itemCategory">
							<li id="category" value="과일">과일</li>
							<li id="category" value="채소">채소</li>
							<li id="category" value="육류계란">육류</li>
							<li id="category" value="냉동식품">냉동식품</li>
							<li id="category" value="소스">소스</li>
						</ul>
					</div>
					<section class="categories">
						<div class="container">
							<div class="row">
								<div class="categories__slider owl-carousel" id="change">
									<c:forEach var="i" items="${itemList}" varStatus="cnt">
										<a href="recipeInfo.do?no=${i.item_no}&job=recipeinfo">
											<div class="col-lg-3">
												<div class="categories__item set-bg">
													<div>
														<h5 style="color: black"></h5>
													</div>
													<img src="${i.item_img }" width="100%" height="100%">
												</div>
												<div style="padding: 10px 0px 10px 0px">
													<h4>${i.item_name}</h4>
												</div>
												<div>
													<h5>${i.item_price}원</h5>
												</div>
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
	</section>

	<!-- Footer Section Begin -->
	<jsp:include page="footer.jsp"></jsp:include>

	<!-- Js Plugins -->
	<div id="delslide">
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/owl.carousel.min.js"></script> 
	 	<script src="js/jquery.slicknav.js"></script> 
		<script src="js/main.js"></script>
	</div>
	
  	<script src="js/bootstrap.min.js"></script> 
 	<script src="js/jquery.nice-select.min.js"></script> 
 	<script src="js/jquery-ui.min.js"></script> 
	<script src="js/mixitup.min.js"></script>

	<!-- 부트스트랩 -->
	
	<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

<script type="text/javascript">
	  $(function(){
	 		$("li#category").click(function(){
	 			var category=$(this).attr('value');
	 			ajaxCategory('/web/mainPageCategory.do',{category:category});
	 	    });
	 	});

 	   function ajaxCategory(url,data){
			var temp="";
		     $.ajax({
		          url: url,cache:false,
		          type:'POST',
		          data: data,             
		          dataType:'json',
		          success:function(v){
		        	  $.each(v,function(index,dom){
		        		  temp+= "<a href=\"shopInfo.do?no="+dom.item_no+"&job=iteminfo\">";
		        		  temp+= "<div class=\"col-lg-3\">";
		        		  temp+= "<div class=\"categories__item set-bg\">";
		        		  temp+=	"<div>";
		        		  temp+=	"	<h5 style=\"color: black\"></h5>";
		        		  temp+=	"</div>";
		        		  temp+=	"<img src=\""+dom.item_img+"\" width=\"100%\" height=\"100%\">";
		        		  temp+="</div>";
		        		  temp+="<div style=\"padding: 10px 0px 10px 0px\">";
		        		  temp+="	<h4>"+dom.item_name+"</h4>";
		        		  temp+="</div>";
		        		  temp+="<div><h5>"+dom.item_price+"원 </h5></div></div></a>";
		        	  });
		        		$("div#change").html(temp);
		        	
						$("div#delslide").html("");

		         		loadScript('js/jquery-3.3.1.min.js');
		        		loadScript('js/owl.carousel.min.js');
		        		loadScript('js/jquery.slicknav.js');
		        		loadScript('js/main.js');
		        		 
		        		// $("div#delslide").load(location.href + 'div#delslide');
		       		 	/* $.getScript('js/jquery-3.3.1.min.js');
		        		$.getScript('js/owl.carousel.min.js');
		        		$.getScript('js/jquery.slicknav.js');
		        		$.getScript('js/main.js');*/
		        		
		        	
		          },
		          error:function(request,status,error){
		              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		             }
		       });   
		  }
 	   
 	  function loadScript(scriptLocationAndName) {
/*  		    var head = document.getElementsByTagName('head')[0];
 		    var div = document.getElementById("delscript")[0]; */
 		    
 		    var script = document.createElement('script');
 		    script.src = scriptLocationAndName;
 		   	$("div#delslide").append(script);
 			//$("div#delslide").html(script);
 		    
 		 //   head.appendChild(script);
 		}

</script>
</body>

</html>
