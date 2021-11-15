<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>


<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
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

	<!-- 로그인(Login)-아이디찾기 -->

	<section class="section confirmation">
		<div class="container">
			<div class="row justify-content-center m-t-85 m-b-200">
				<div class="col-lg-8">
					<div class="confirmation-content text-center">
						<span class="login100-form-title p-b-70"> 아이디 찾기 </span>
						<!--  -->
						<form method="post" class="form-signin" action="find_id.do"
							name="findform">


							<!-- 	<div class="form-label-group">
								<input type="text" id="name" name="name" class="form-control" />
								<label for="name">name</label>
							</div> -->
							<div class="wrap-input100 validate-input m-t-85 m-b-35"
								data-validate="Enter username">
								<input class="input100" type="text" id="name" name="user_name">
								<span class="focus-input100" data-placeholder="name"></span>
							</div>

							<!-- 		<div class="form-label-group">
								<input type="text" id="phone" name="phone" class="form-control" />
								<label for="phone">phone</label>
							</div> -->
							<div class="wrap-input100 validate-input m-b-50"
								data-validate="Enter password">
								<input class="input100" type="text" id="phone" name="user_tel">
								<span class="focus-input100" data-placeholder="phone"></span>
							</div>

							<!-- 	<div class="form-label-group">
								<input class="btn btn-lg btn-secondary btn-block text-uppercase"
									type="submit" value="check">
							</div> -->
							<div class="container-login100-form-btn">
								<input class="login100-form-btn" type="submit" value="아이디 찾기" />
							</div>

							<!-- 이름과 전화번호가 일치하지 않을 때-->
							<c:if test="${check == 1}">
								<script>
									opener.document.findform.name.user_name = "";
									opener.document.findform.user_tel.value = "";
								</script>
								<label style="margin-top: 100px; color: red;">일치하는 정보가
									존재하지 않습니다.</label>
							</c:if>

							<!-- 이름과 비밀번호가 일치하지 않을 때 -->
							<c:if test="${check == 0 }">
								<label style="margin-top: 100px; margin-bottom: 100px">찾으시는
									아이디는'<strong style="color: #6bbbff">${fid}</strong>' 입니다.
								</label>
								<div class="form-label-group">
									<input class="login100-form-btn" type="button" value="OK"
										onclick="closethewindow()">
								</div>
							</c:if>

						</form>
						<!--  -->

					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- 로그인(Login) -->


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
		function closethewindow() {
			location.href='login.jsp';	
		}
	</script>

</body>


</html>