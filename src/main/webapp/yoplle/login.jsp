<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>


<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

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
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/util.css">
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

	<!-- 로그인(Login) -->

	<section class="section confirmation">
		<form name="loginFrm" method="post" action="login.do">
			<div class="container">
				<div class="row justify-content-center m-t-85 m-b-200">
					<div class="col-lg-8">
						<div class="confirmation-content text-center">
							<span class="login100-form-title p-b-70"> LOGIN </span>

							<div class="wrap-input100 validate-input m-t-85 m-b-35" data-validate="Enter username">
								<input class="input100" type="text" name="id" id="id">
								<span class="focus-input100" data-placeholder="Username"></span>
							</div>

							<div class="wrap-input100 validate-input m-b-50" data-validate="Enter password">
								<input class="input100" type="password" name="password" id="password">
								<span class="focus-input100" data-placeholder="Password"></span>
							</div>

							<div style="padding-bottom: 20px">
								<span style="color: red; font-weight: 550">${error}</span>
							</div>

							<div class="container-login100-form-btn">
								<br> <span><input type="checkbox">아이디 저장 &nbsp;<input type="checkbox">보안접속</span>&nbsp;&nbsp;&nbsp;
								&nbsp; <span><a href="find_id_form.do">아이디 찾기</a> &nbsp; <a
										href="find_password_form.do">비밀번호 찾기</a></span> <br> <br> <br>

								<c:catch>
									<c:choose>
										<c:when test="${recipe eq null && cart eq null}">
											<button class="login100-form-btn" id="signin">로그인</button>


										</c:when>

										<c:when test="${cart ne null}">
											<button class="login100-form-btn" id="signin">로그인</button>
											<input type="text" value="${cart}" hidden="hidden" name="cart">
											<input type="text" value="${itemno }" hidden="hidden" name="itemno">
										</c:when>
										<c:otherwise>

											<button class="login100-form-btn" id="signin">로그인</button>
											<input type="text" value="${recipe}" hidden="hidden" name="recipe">

										</c:otherwise>
									</c:choose>
								</c:catch>

								<br> <br> <br>
								<button class="login100-form-btn">회원가입</button>
							</div>

						</div>
					</div>
				</div>
			</div>
		</form>
	</section>


	<!-- 로그인(Login) -->


	<!-- Footer Section Begin -->
	<jsp:include page="footer.jsp"></jsp:include>
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

	<script type="text/javascript">
		$(function() {
			$("button#signin").click(
					//a태그안의  id='signin'을 클릭
					function() {
						//alert($("input#id").val());
						if ($("input#password").val().length == 0
								|| $("input#id").val().length == 0) {
							alert('ID OR PW 확인!!');

							$("input#password").val('');
							$("input#id").val('');

							return false;
						}
						$("form").submit();
					});
		});
	</script>


</body>

</html>