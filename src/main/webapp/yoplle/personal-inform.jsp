<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
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
<link rel="stylesheet" href="css/form-basic.css">
</head>

<body>
	<jsp:include page="header.jsp" />

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>마이페이지</h4>
							<ul>
								<li><a href="#" id="modi">개인정보수정</a></li>
								<li><a href="#" id="list">마이 레시피</a></li>

							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-7">
					<form method="post" action="mypage.do" id="mypage">
						<input type="text" value="${ userinfo.user_no}" name="no" hidden="hidden">
						<input type="text" value="${id}" name="id" hidden="hidden">
					</form>

					<form method="post" action="mypagelist.do" id="mypagelist">
						<input type="text" value="${ userinfo.user_no}" name="userNo" hidden="hidden">
					</form>
					<form class="form-basic" method="post" action="mypageModify.do">
						<input type="text" value="${userinfo.user_no}" name="userNo" hidden="hidden">
						<div class="form-title-row">
							<h1>개인 정보 수정</h1>
						</div>

						<div class="rqd">
							<span class="rqdchar">*</span> 필수 사항
						</div>

						<div class="form-row">
							<label>
								<span class="title">아이디 <span class="rqdchar">*</span>
								</span>
								<input type="text" name="user_id" id="user_id" value="${userinfo.user_id}" disabled>
							</label>
							<div class="validCheck" id="validId"></div>
						</div>

						<div class="form-row">
							<label>
								<span class="title">비밀번호 <span class="rqdchar">*</span></span>
								<input type="password" name="user_pw" id="user_pw" placeholder="">
							</label>
							<div class="validCheck" id="validPw"></div>
						</div>

						<div class="form-row">
							<label>
								<span class="title">비밀번호 확인 <span class="rqdchar">*</span></span>
								<input type="password" id="pwCheck">
							</label>
							<div class="validCheck" id="validPwCheck"></div>
						</div>

						<div class="form-row">
							<label>
								<span class="title">이름 <span class="rqdchar">*</span></span>
								<input type="text" name="user_name" id="user_name" value="${userinfo.user_name}">
							</label>
							<div class="validCheck" id="validName"></div>
						</div>

						<div class="form-row">
							<label>
								<span class="title">핸드폰 번호 <span class="rqdchar">*</span></span>
								<input type="tel" name="user_tel" id="user_tel" value="${userinfo.user_tel }"
									placeholder="010-0000-0000">
							</label>
							<div class="validCheck" id="validTel"></div>
						</div>

						<div class="form-row">
							<label class="email">
								<span class="title">이메일 <span class="rqdchar">*</span></span>
								<input type="email" name="user_mail" id="user_mail" value="${userinfo.user_mail }"
									placeholder="yoplle@market.com">
							</label>
							<div class="validCheck" id="validMail"></div>
						</div>

						<div class="form-row">
							<label>
								<span class="title">우편번호 <span class="rqdchar">*</span></span>
								<input type="text" name="user_postcode" id="user_postcode" value="${userinfo.user_postcode}">
								<button class="btn-css" type="button" id="addrsearch">주소검색</button>
							</label>
							<div class="validCheck" id="validPost"></div>
							<c:set var="addrArr" value="${userinfo.user_address}" />


							<%-- <label>
								<span class="title">주소 <span class="rqdchar">*</span></span>
								<input type="text" name="user_address" id="user_address"
									value="${functions:split(addrArr,',')[0]}">
							</label>
							<div class="validCheck" id="validAddr"></div> --%>

							<label>
								<span class="title">주소 <span class="rqdchar">*</span></span>
								<input type="text" name="addr" id="addr" value="${functions:split(addrArr,',')[0]}">
								<input type="text" name="user_address" id="user_address" hidden="hidden">
							</label>
							<div class="validCheck" id="validAddr"></div>


							<label>
								<span class="title">상세주소</span>
								<input type="text" name="addrDetail" id="addrDetail"
									value="${functions:split(addrArr,',')[1]}">
							</label>




						</div>


						<div class="form-row">
							<label>
								<span class="title">생년월일 <span class="rqdchar">*</span></span>
								<input type="date" name="user_birth" id="user_birth" value="${userinfo.user_birth}">
							</label>
							<div class="validCheck" id="validBirth"></div>
						</div>
						<!-- 
						<div class="form-row">
							<span class="titlegen">성별 <span class="rqdchar">*</span></span>
							<div class="form-radio">
								<input type="radio" name="user_gender" id="male" checked="checked" value="남자">
								<label for="male">남자</label>
							</div>
							<div class="form-radio">
								<input type="radio" name="user_gender" id="female" value="여자">
								<label for="female">여자</label>
							</div>
						</div>
 -->


						<div class="form-submit">
							<button type="submit" class="btn-submit" id="modify">수정완료</button>
						</div>

					</form>

				</div>
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

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		$(function() {

			$("a#modi").click(function() {
				$("form#mypage").submit();
			});

			$("a#list").click(function() {
				$("form#mypagelist").submit();
			});

			$("button#addrsearch").click(function() {
				adrr();
			});

			$("input#user_postcode").click(function() {
				adrr();
			});

			function adrr() {
				new daum.Postcode(
						{
							oncomplete : function(data) { //선택시 입력값 세팅
								document.getElementById("user_postcode").value = data.zonecode; // 우편번호 넣기
								document.getElementById("addr").value = data.address; // 주소 넣기
								document
										.querySelector("input[name=addrDetail]")
										.focus(); //상세입력 포커싱
							}
						}).open();
			}

			$("button#modify").click(
					function() {
						if ($("input#user_id").val() == ""
								|| $("input#user_pw").val() == ""
								|| $("input#pwCheck").val() == ""
								|| $("input#user_name").val() == ""
								|| $("input#user_tel").val() == ""
								|| $("input#user_mail").val() == ""
								|| $("input#user_postcode").val() == ""
								|| $("input#addr").val() == ""
								|| $("input#user_birth").val() == "") {
							alert('필수사항을 확인해주세요');
							return false;
						}

						$("input#user_address").val(
								$("input#addr").val() + ','
										+ $("input#addrDetail").val());
						$("form").submit();
					});

			$("input#user_pw").blur(function() { //비밀번호 유효성 검사
				var pwRegExp = /^[a-z0-9]{4,20}$/;
				if (!pwRegExp.test($(this).val())) {
					$("div#validPw").text("4~20자의 영문 소문자와 숫자만 가능합니다");
					$(this).val('');
					return false;
				}
				if ($("input[name='user_id']").val() == $(this).val()) {
					$("div#validPw").text("아이디와 비밀번호를 다르게 설정해주세요");
					$(this).val('');
					return false;
				}
				$("div#validPw").text("");
			});

			$("input#pwCheck").blur(function() {
				if ($("input#user_pw").val() != $("input#pwCheck").val()) {
					$("div#validPwCheck").text("비밀번호가 일치하지 않습니다");
					$(this).val('');
					return false;
				}
				$("div#validPwCheck").text("");
			});

			$("input[name='user_tel']").blur(function() { //핸드폰 번호 유효성 검사
				var telRegExp = /^01(?:0|1|[6-9])-(\d{3}|\d{4})-(\d{4})$/;
				if (!telRegExp.test($(this).val())) {
					$("div#validTel").text("형식이 올바르지 않습니다 (010-1234-1234)");
					$(this).val('');
					return false;
				}
				$("div#validTel").text("");
			});

			$("input[name='user_mail']")
					.blur(
							function() { //이메일 유효성 검사
								var mailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
								if (!mailRegExp.test($(this).val())) {
									$("div#validMail")
											.text("이메일 형식이 올바르지 않습니다");
									$(this).val('');
									return false;
								} else {
									$("input#add").val(
											$("input[name='tel1']").val())
								}
								$("div#validMail").text("");
							});

			$("input[name='user_birth']")
					.blur(
							function() { //생년월일 유효성 검사
								var today = new Date();
								var year = today.getFullYear();

								var birthRegExp = /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
								if (!birthRegExp.test($(this).val())) {
									$("div#validBirth").text("생년월일을 확인해주세요");
									$(this).val('');
									return false;
								}
								if (($(this).val()).substr(0, 4) <= 1900
										|| ($(this).val()).substr(0, 4) > year) {
									$("div#validBirth").text("생년월일을 확인해주세요");
									$(this).val('');
									return false;
								}
								$("div#validBirth").text("");
							});

		});
	</script>



</body>

</html>