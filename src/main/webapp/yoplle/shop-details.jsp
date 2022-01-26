<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Css Styles -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />


<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/shop-detail.css">
<link rel="stylesheet" href="css/question-table.css">

<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
<link rel="stylesheet" href="css/recipe-detail-style.css" type="text/css">
<link rel="stylesheet" href="css/slidestyle.css">
<link rel="stylesheet" href="css/review-table.css">
<link rel="stylesheet" href="css/recipe-detail-style.css">
</head>

<body> 
	<jsp:include page="header.jsp" />
	<!-- Breadcrumb Section Begin -->
	<div class="container">
		<div class="heading-section"></div>
		<div class="row">
			<div class="flex-jaeil display-flex iteminfo">
				<img  class="shop-main-image shopmainimg" src="${iteminfo.item_img}"/>


				<div class="col-md-6">
					<div class="product-dtl">
						<div class="product-info">
							<div class="product-name">${iteminfo.item_name}</div>

							<div class="product-volum">
								<span>용량 : </span><span class="line-through">1팩 / 300g</span>
							</div>
							<div class="product-volum">
								<span>카테고리 : </span><span class="line-through">${iteminfo.item_category}</span>
							</div>
							<div class="product-volum">
								<span>등록날짜 : </span><span class="line-through">${iteminfo.item_date }</span>
							</div>
							<div class="product-volum">
		
								<span>원산지 : </span><span class="line-through">${iteminfo.item_origin }</span>
							</div>
							
						</div>
						
						<!-- 해당 페이지에서 단일 상품 결제 혹은 장바구니에 상품 담을 시 넘길 값 -->
						<form id="idCheckSet" method="post" action="">
							<input type="text" name="id" hidden="hidden" value="${id}">
							<input type="text" name="itemno" hidden="hidden" value="${iteminfo.item_no}">
							<input type="text" name="ea" id="eaInput" hidden="hidden" value="">
							<input type="text" name="userno" id="userno"  hidden="hidden" value="${no}">
						</form>

						<div class="product-count">
							<form action="#" class="display-flex">
								<div class="downEa">-</div>
								<input type="text" name="quantity" value="1" class="qty" id="qty">
								<div class="upEa">+</div>
							</form>
							<div id="price">${iteminfo.item_price} 원</div>

						</div>
						<div id="btns">
							<c:catch>
								<c:choose>
									<c:when test="${id eq null}"> <!-- 로그인을 하지 않았을 경우 로그인 페이지로 이동 -->
									   <a href="#" class="round-black-btn" id="sendlogin">
									      <form id="sendlogin" method="POST" action="cartlogin.do">
									         <input type="text" value="${iteminfo.item_no}" hidden="hidden" name="itemno">
									         바로구매
									      </form>
									   </a>
									   <a href="#" class="round-black-btn" id="sendlogin">
									      <form id="sendlogin" method="POST" action="cartlogin.do">
									         <input type="text" value="${iteminfo.item_no}" hidden="hidden" name="itemno">
									         장바구니
									      </form>
									   </a>
									</c:when>
									<c:otherwise> <!-- 로그인 상태 -->
										<a href="#" class="round-black-btn" id="itemOrder">바로 구매</a>
										<a href="#" class="round-black-btn" id="cartIn">장바구니</a>
									</c:otherwise>
								</c:choose>
							</c:catch>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 추천 레시피 박스 -->
		<div class="product-match-recipe">
		<c:if test="${not empty recipeMatch}">
		<div id="card-part">
	<span class="card-item-title">추천 레시피 살펴보기</span>
	<span class="card-item-title-second">Recipe</span>
 <div class="row shop">
    <div class="col-md-12">
      <div class="carousel carousel-showmanymoveone slide" id="carouselABC" >
        <div class="carousel-inner">
           	<c:forEach var="i" items="${recipeMatch}" varStatus="cnt">
           		<c:set var="img" value="${i.rpe_img}" />
				<c:set var="imglist" value="${functions:split(img,'/')}" />
           		<c:choose>
					<c:when test="${cnt.index == 0}">
			          <div class="item active">
			           <a href="recipeInfo.do?no=${i.rpe_no}&job=recipeinfo">
			            <div class="col-xs-12 col-sm-6 col-md-3">
			            	<img src="${i.rpe_img}" class="img-responsive item-img">
				            <div class="item-name">${i.rpe_title}</div> 
			                <div class="item-price">${i.user_name}&nbsp;</div>
			            </div>
			           </a>
			         </div>
					</c:when>
					<c:otherwise>
					  <div class="item">
					  	<a href="recipeInfo.do?no=${i.rpe_no}&job=recipeinfo">
           					<div class="col-xs-12 col-sm-6 col-md-3">
           					<c:catch>
								<c:choose>
									<c:when test="${imglist[1] ne null }">
		           						<img src="${i.rpe_img}" class="img-responsive item-img">
           							</c:when>
									<c:otherwise>
		           						<img src="img/recipe/${i.rpe_img}" class="img-responsive item-img">
									</c:otherwise>
								</c:choose>
							</c:catch>
           						<div class="item-name">${i.rpe_title}</div> 
			                	<div class="item-price">${i.user_name}</div>
           					</div>
           				</a>
         			  </div>
					</c:otherwise>
				</c:choose>
          </c:forEach>
        </div>
        <a class="left carousel-control" href="#carouselABC" data-slide="prev" id="slide-left-btn"><i class="glyphicon glyphicon-chevron-left"></i></a>
        <a class="right carousel-control" href="#carouselABC" data-slide="next" id="slide-right-btn"><i class="glyphicon glyphicon-chevron-right"></i></a>
      </div>
    </div>
  </div>
  </div>
  </c:if>
		<!-- 추천 레시피 박스 끝 -->

		<div class="product-info-tabs">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="description-tab" data-toggle="tab"
						href="" role="tab" aria-controls="상품 소개" aria-selected="true" onclick="fnMove('#isdetail-')">상품 소개</a></li>
				<li class="nav-item"><a class="nav-link" id="review-tab" data-toggle="tab" href=""
						role="tab" aria-controls="상품 후기" aria-selected="false" onclick="fnMove('#review-')">상품 후기</a></li>
				<li class="nav-item"><a class="nav-link" id="qna-tab" data-toggle="tab" href="" role="tab"
						aria-controls="상품 문의" aria-selected="false" onclick="fnMove('#faq-')">상품 문의</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="description" role="tabpanel"
					aria-labelledby="description-tab"></div>
					<div id="isdetail-tapp" style="text-align: center; margin-bottom: 20px;">
					<img src="${iteminfo.item_de_content}" style="width: 80%" />
					</div>
				<!-- 상품 설명 및 버튼 페이지 끝 -->
				<!-- 문의 리스트 설명 및 정렬 셀렉트 -->
				<div class="container">
					<div class="table-intro">
						<div class="table-title">
							<h3 id="review-tapp">상품 후기</h3>
							<ul class="table-title-ul">
								<li class="table-title-li">상품에 대한 후기를 위한 공간입니다.</li>
								<li class="table-title-li" id="table-title-liNbox">상대방을 배려하는 마음을 보여 주세요. 욕설 및 비방 글은 무통보
									삭제될 수 있습니다. <select>
										<option value="0" selected="selected">정렬 선택</option>
										<option value="new">최신순 정렬</option>
										<option value="hit">조회순 정렬</option>
								</select>
								</li>
							</ul>
						</div>
					</div>
					<div class="table-container">
						<div class="table-header">
							<!-- 메뉴 머리 -->
							<ul class="table-header-ul">
								<li class="table-header-item">글번호</li>
								<li class="table-header-item">제목</li>
								<li class="table-header-item">작성자</li>
								<li class="table-header-item">날짜</li>
							</ul>
						</div>
						<div id="accordion">
							<c:forEach  var="rvl" items="${reviewList}">
							<div class="card-jaeil">
								<div class="card-header">
									<a class="card-link" data-toggle="collapse" href="#collapser${rvl.review_no}">
										<div class="table-inner">
											<!-- 메뉴 머리 -->
											<ul class="table-inner-ul">
												<li class="table-inner-item">${rvl.review_no}</li>
												<li class="table-inner-item">${rvl.review_title}</li>
												<li class="table-inner-item">${rvl.user_id}</li>
												<li class="table-inner-item"><fmt:parseDate value="${rvl.review_date}" var="review_date" pattern="yy-MM-dd"/>
												<fmt:formatDate value="${review_date}" pattern="yy-MM-dd" /></li>
											</ul>
										</div>
									</a>
								</div>
								<div id="collapser${rvl.review_no}" class="collapse" data-parent="#accordion">
									<div class="card-body">
										<div class="table-page">
											<!-- 메뉴 눌렀을 때 페이지 -->
											<div class="table-page-proname">[${iteminfo.item_category}] ${iteminfo.item_name}</div>
											<ul class="table-page-ul">
												<li class="table-page-item">${rvl.review_content}</li>
											</ul>
										</div>
									</div>
								</div>
								</div>
								</c:forEach>
							</div>
									<!-- <div class="write-review">
									</div> -->
								</div>
							</div>
						</div>
							<!-- 작성 버튼 칸 -->

							<!-- <div class="table-btn">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#">Previous</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">4</a></li>
									<li class="page-item"><a class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#">Next</a></li>
								</ul>
									<button class="site-btn" id="r-btn">후기 작성</button>
							</div> -->
							<!-- 리뷰, 문의 리스트 -->



							<!-- 문의 리스트 설명 및 정렬 셀렉트 -->
							<div class="q-container">
								<div class="q-table-intro">
									<div class="q-table-title">
										<h3 id="faq-tapp">상품 문의</h3>
										<ul class="q-table-title-ul">
											<li class="q-table-title-li">상품에 대한 문의를 위한 공간입니다.</li>
											<li class="q-table-title-li" id="q-table-title-liNbox">상대방을 배려하는 마음을 보여 주세요. 욕설 및 비방
												글은 무통보 삭제될 수 있습니다. <select>
													<option value="0" selected="selected">정렬 선택</option>
													<option value="new">최신순 정렬</option>
													<option value="hit">조회순 정렬</option>
											</select>
											</li>
										</ul>
									</div>
								</div>
								<div class="table-container-q">
									<div class="table-header-q">
										<!-- 메뉴 머리 -->
										<ul class="q-table-header-ul" style="margin-bottom: 0px; border-bottom-width: 0px;">
											<li class="q-table-header-item"></li>
											<li class="q-table-header-item">제목</li>
											<li class="q-table-header-item">작성자</li>
											<li class="q-table-header-item">날짜</li>
											<li class="q-table-header-item">답변상태</li>
										</ul>
									</div>
									<div id="accordion">
									<c:forEach var="fl" items="${faqList}" >
										<div class="jaeil-card-jaeil">
											<div class="card-header">
												<a class="card-link" data-toggle="collapse" href="#collapseq${fl.faq_no}">
													<div class="q-table-inner">
														<!-- 메뉴 리스트 -->
														<ul class="q-table-inner-ul">
															<li class="q-table-inner-item"><i class="fas fa-lock-open"></i></li>
															<li class="q-table-inner-item">${fl.faq_title}</li>
															<li class="q-table-inner-item">${fl.user_id}</li>
															<li class="q-table-inner-item"><fmt:parseDate value="${fl.faq_date}" var="faq_date" pattern="yy-MM-dd"/>
												<fmt:formatDate value="${faq_date}" pattern="yy-MM-dd" /></li>
													<c:choose>
													<c:when test="${fl.emp_no eq 1}"> <!-- 관리자 번호는 1번이므로 관리자가 배치되었다면 답변이 완료된 상태 -->
															<li class="q-table-inner-item">답변 완료</li>
													</c:when>
						
													
													<c:when test="${fl.emp_no eq 0}"> <!-- 관리자 번호는 1번이므로 관리자가 배치되지 않았다면 답변 대기 상태 -->
															<li class="q-table-inner-item">답변 대기</li>
													</c:when>
													</c:choose>
														</ul>
													</div>
												</a>
											</div>
											<div id="collapseq${fl.faq_no}" class="collapse" data-parent="#accordion">
												<div class="card-body">
													<div class="q-table-page">
														<!-- 메뉴 눌렀을 때 페이지 -->
														<div class="q-table-page-proname">[${iteminfo.item_category}] ${iteminfo.item_name}</div>
														<ul class="q-table-page-ul">
															<li class="q-table-page-item">${fl.faq_content}</li>
														</ul>
														<div class="q-table-page-anwser">
															<!-- 메뉴 눌렀을 때 페이지 -->
											<c:if test="${fl.emp_no eq 1}"> <!-- 답변이 완료된 상태라면 답변도 함께 짝지어 출력 -->
															<ul class="q-table-page-titleNstate">
																<li class="q-table-page-item-title">답변 : re:${fl.faq_title}</li>
																<li class="q-table-page-item-state">답변 완료</li>
															</ul>
															<ul class="q-table-page-ul">
																<li class="q-table-page-item">${fl.ans_content}</li>
															</ul>
															
											</c:if>
														</div>
													</div>
												</div>
											</div>
										</div>
										</c:forEach>
									</div>
									
									<div class="write-faq">
									
									</div>
								</div>
							</div>
					</div>
				</div>
			<!-- 작성 버튼 칸 -->

			<div class="table-btn">
				<!-- <ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="
					page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul> -->
				
					<button class="site-btn" id="q-btn">문의 작성</button>
				
			</div>
		</div>

	</div>
	<!-- Related Product Section End -->

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


	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
	<script  src="js/slidescript.js"></script>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
	<script type="text/javascript">
	var no=$("input#userno").val();
	/* 클릭하는 버튼에 따른 tag로 이동 */
      function fnMove(seq){
          var offset = $(seq+'tapp').offset();
          
          $('html, body').animate({scrollTop : offset.top}, 400);
      	}

		$(function(){
			
			$("a#notice").click(function() {
				if (confirm("로그인이 필요한 페이지입니다. 로그인 하시겠습니까?") == true) { //확인
					document.removefrm.submit();
				} else { //취소
					return false;
				}
			});
			
			/* 상품 수량 감소 */
			$("div.downEa").click(function(){
				if($('#qty').val()>1){
				$.ajax({
					url:window.location.href,
					success:function(){
						 var q = parseInt($("#qty").val())-1;    
				         $("#qty").val(q);
				         var price=${iteminfo.item_price}*$("#qty").val();
				         $("#price").text(price+" 원");
					}
				});
				}
			});
			
			/* 상품 수량 추가 */
			$("div.upEa").click(function(){
				$.ajax({
					url:window.location.href,
					success:function(){
						 var q = parseInt($("#qty").val())+1;    
				         $("#qty").val(q);
				         var price=${iteminfo.item_price}*$("#qty").val();
				         $("#price").text(price+" 원");
					}
				});
				
			});
			
			var temp="";
			/* 로그인 검증 */
			$("button#q-btn").click(function(){
				if($("input#userno").val()==""){
					alert('로그인이 필요합니다');
					return false;
				}
				/* faqWriterform이라는 태그가 없을 시에 태그를 추가함 (중복 생성되지 않기 위함) */
				if(!document.getElementById('faqWriterform')){
				$.ajax({
				url:window.location.href,
				success: function(v){
				temp+="<form id=\"faqWriterform\" action=\"shopInfo.do?no=${iteminfo.item_no}&job=newFaq\" method=\"post\">";
				temp+="<input type=\"text\" name=\"faq_title\" class=\"qinput q_inputTitle\" placeholder=\"제목을 입력해 주세요\">";
				temp+="<input type=\"password\" name=\"faq_pw\" class=\"qinput q_inputPw\" placeholder=\"비밀번호 입력\">";
				temp+="<input type=\"text\" hidden=\"hidden\" name=\"user_no\" class=\"qinput q_inputUserno\" value=\""+no+"\">";
				temp+="<input type=\"text\" hidden=\"hidden\" name=\"item_no\" class=\"qinput q_inputItemno\" value=\"${iteminfo.item_no}\">";
				temp+="<input type=\"text\" hidden=\"hidden\" name=\"faq_img\" class=\"qinput q_inputItemno\" value=\"${iteminfo.item_img}\">";
				temp+="<textarea name=\"faq_content\" rows=\"5\" cols=\"100\" class=\"qinput q_inputcontent\" placeholder=\"내용을 입력해 주세요\"></textarea></form>";
				temp+="<button class=\"q-writer-btn\">확인</button>";
				$("div.write-faq").append(temp);
				temp="";
				}
				});
				}
				});
			/* q-writer-btn을 클릭하였을 때 form으로 값을 넘김 */
			$(document).on("click", ".q-writer-btn", function(){
				$("form#faqWriterform").submit();
			});
			
			$("a#itemOrder").click(function(){ 
				$("#idCheckSet").attr("action", "itemOrder.do");
				$("#eaInput").val($('#qty').val());
				$("form#idCheckSet").submit();
			});
			
			$("a#cartIn").click(function(){
				$("#idCheckSet").attr("action", "cartIn.do");
				$("#eaInput").val($('#qty').val());
				$("form#idCheckSet").submit();
			});
	
			$("a#sendlogin").click(function(){
	            if (confirm("로그인이 필요한 페이지입니다. 로그인 하시겠습니까?") == true) { //확인
	               $("form#sendlogin").submit();
	            } else { //취소
	               return false;
	            }
	            
	         });
			
		});
		
		
	</script>
</body>

</html>