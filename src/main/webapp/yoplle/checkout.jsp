
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

<!-- iamport -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
</head>

<body>
	<jsp:include page="header.jsp" />

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>주문 내역</h2>
						<div class="breadcrumb__option"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h6>
						<span class="icon_tag_alt"></span> 할인 프로모션 코드는
						<a href="#">여기</a>
						에 입력해 주세요
					</h6>
				</div>
			</div>
			<div class="checkout__form">
				<h4>주문 내역</h4>
						<form id="checkSuc" action="checkSuc.do" method="POST">
			
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="checkout__input">
								<p>
									주문자<span>*</span><span id="nameCheck"></span>
									<div id="nameError"></div>
								</p>
								<input type="text" name="order_rec_name" value="${userinfo.user_name}">
							</div>
							<div class="checkout__input">
								<p>
									전화번호<span>*</span><span id="telCheck"></span>
								</p>
								<input type="text" name="order_rec_tel" value="${userinfo.user_tel}">
							</div>
							<div class="checkout__input">
								<p>
									배송지<span>*</span>
									<button type="button" class="jaeil-site-btn" id="zip-set">배송지 입력</button>
								</p>
								<input type="text" id="zipcode" hidden="hidden" placeholder="우편번호" name="order_dv_zipcode">
								<input type="text" placeholder="주소명" class="checkout__input__add" id="main_addr">
								<input type="text" placeholder="동, 호수" id="detail_addr">
								<!-- <input type="text"  -->
								<input type="text" hidden="hidden" name="order_dv_addr" id="order_dv_addr">
							</div>
							<div class="checkout__input">
								<p>현관 비밀번호</p>
								<input type="text">
							</div>
							<div class="checkout__input">
								<p>이메일</p>
								<input type="text">
							</div>
							<div class="checkout__input__checkbox">
								<label for="acc"> 주문 내역을 이메일로 받으시겠습니까? <input type="checkbox" id="acc"> <span
									class="checkmark"></span>
								</label>
							</div>
							<p class="pay_jaeil">
								결제 수단<span>*</span>
							</p>
							<div class="checkout__input__radiobox">
								<label class="checkmark-jaeil"> <input type="radio" name="paytype" id="diff-acc"
										value="무통장입금">&nbsp;무통장 입금 <span class="checkmark"></span>
								</label> <label class="checkmark-jaeil"> <input type="radio" name="paytype" id="diff-acc"
										value="카카오페이">&nbsp;카카오페이 <span class="checkmark"></span>
								</label> <label class="checkmark-jaeil"> <input type="radio" name="paytype" id="diff-acc"
										value="페이코결제">&nbsp;페이코 결제 <span class="checkmark"></span>
								</label> <label class="checkmark-jaeil"> <input type="radio" name="paytype" id="diff-acc"
										value="신용카드">&nbsp;신용카드 <span class="checkmark"></span>
								</label>
								<p class="small-jaell">※ 카카오페이, 차이, 토스, 네이버페이, 페이코 결제 시, 결제하신 수단으로만 환불되는 점 양해부탁드립니다.</p>
								<p class="small-jaell">※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 토스 페이먼츠의 구매안전(에스크로) 서비스를
									이용하실 수 있습니다.</p>
								<p class="small-jaell">※ 보안강화로 Internet Explorer 8 미만 사용 시 결제창이 뜨지 않을 수 있습니다.</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h4>주문 내역</h4>
								<div class="checkout__order__products">
									상품명 <span>가격</span>
								</div>
								<ul>
									<li><div id="nameTag">[${iteminfo.item_category}] ${iteminfo.item_name}</div> <span id="prices">${iteminfo.item_price*ea} 원</span></li>
								</ul>
								<div class="checkout__order__subtotal">
									상품 총 금액 <span><c:out value="${iteminfo.item_price*ea}"/> 원</span>
								</div>
								<div class="checkout__order__send">
									배송 금액 <span id="dvPrice">3,000원</span>
								</div>
								<div class="checkout__order__total">
									총 금액 <span>${(iteminfo.item_price*ea)+3000} 원</span>
								</div>
								<div class="checkout__input__checkbox">
									<label for="acc-or"> (필수) 결제에 동의하십니까? <input type="checkbox" id="acc-or"> <span
										class="checkmark"></span>
									</label>
										<div id="errorSet"></div>
								</div>
								<p>동의하실 경우 구매자의 단순 변심으로 인한 환불 및 교환이 어려울 수 있습니다.</p>
								<button type="button" class="site-btn" id="checkOutBtn">결제하기</button>
								
									<input type="text" hidden="hidden" name="user_no" value="${userinfo.user_no}">
									<input type="text" hidden="hidden" name="order_dv_sts" value="주문확인">
									<input type="text" name="no" hidden="hidden" value="${iteminfo.item_no}">
									<input type="text" hidden="hidden" name="ea" value="${ea}">
									<input type="text" hidden="hidden" name="or_de_quan" value="${ea}">
									<input type="text" hidden="hidden" name="or_de_back" value="n">
							
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	/* 우편번호와 주소 API */
	$(function(){
		$('#zip-set').click(function(){
			 new daum.Postcode({
			        oncomplete: function(data) {
			            document.getElementById("zipcode").value=data.zonecode;
			            document.getElementById("main_addr").value=data.address; // 주소 넣기
			            document.querySelector("input#detail_addr").focus(); //상세입력 포커싱
			        }
			    }).open();
		});
		$(".checkout__input__add").click(function(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		            document.getElementById("zipcode").value=data.zonecode;
		            document.getElementById("main_addr").value=data.address; // 주소 넣기
		            document.querySelector("input#detail_addr").focus(); //상세입력 포커싱 
		        }
		    }).open();
		});
	});
	</script>
	<script type="text/javascript">
		/* 제약사항 */
		$(function(){
			$("input[name=order_rec_name]").blur(function(){
				if($("input[name=order_rec_name]").val().length>=5 || $("input[name=order_rec_name]").val().length<=1){
					$.ajax({
						url:window.location.href,
						success: function(v){
							var q="아이디는 2~4글자 안으로 설정해 주세요";
							$("input[name=order_rec_name]").val('');
							$("span#nameCheck").text(q);
						}
					});
				}else{
					$.ajax({
						url:window.location.href,
						success: function(v){
							$("span#nameCheck").text('');
						}
					});
				}
			});
			
			$("input[name=order_rec_tel]").blur(function(){
				var telRegExp = /^01(?:0|1|[6-9])-(\d{3}|\d{4})-(\d{4})$/;
				if(!telRegExp.test($(this).val())){
					$.ajax({
						url:window.location.href,
						success: function(v){
							$("span#telCheck").text("형식이 올바르지 않습니다 (010-1234-1234)");
							$("input[name=order_rec_tel]").val('');            
				            return false;
						}
					});
				}else{
					$.ajax({
						url:window.location.href,
						success: function(v){
							$("span#telCheck").text("");
						}
					});
				}

			});
			/* 필수 체크 항목 확인 */
			$("button#checkOutBtn").click(function(){
				if($("#acc-or").prop("checked") && $("#order_dv_addr").val()!=null && $("input[name=order_rec_tel]").val()!=null && $("input[name=order_rec_name]").val()!=null && check==true){
					$("form#checkSuc").submit();
				}else{
					alert('다시 입력해 주세요');
				}
			});
			/* addr에서 값 작성 후 포커스 상실 시 넘겨 주는 form 안의 input에 값 넘김 */
			$("#detail_addr").blur(function(){
				document.getElementById("order_dv_addr").value=$("input#main_addr").val()+' '+$("input#detail_addr").val();
			});
			
			/* 결제 수단 체크 */
			var arrPayType=$("input[name=paytype]");
			var check=false;
			
			$("input[name=paytype]").click(function(){
				for(var i=0; i<arrPayType.length; i++){
					if(arrPayType[i].checked){
						check = true;
					}
				}
			});
		});
	</script>


</body>

</html>