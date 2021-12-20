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


<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- Style -->
<link rel="stylesheet" href="css/style.css">
<body>

	<jsp:include page="header.jsp" />


	<!-- 테이블 -->
	<div class="content">
		<div class="container">
			<span class="noticeintitle">
				<h2>공지사항</h2>
			</span>
			<div class="table-responsive">

				<br> <br> <br>
				<table class="outtable" style="width: 100%">
					<tbody>
						<tr>
							<td>
								<table style="width: 100%">
									<tbody>
										<tr>
											<th class="mainfont" scope="row">제목</th>
											<td colspan="3" class="sidefont">고추장 닭날개 조오림 맛있는 파★</td>
										</tr>
										<tr>
											<th class="mainfont" scope="row">작성자</th>
											<td colspan="3" class="sidefont">최강록</td>
										</tr>

										<tr>
											<th class="mainfont" scope="row">작성일</th>
											<td class="sidefont" style="width: 230px;">2021-10-08</td>
											<th class="mainfont" scope="row">조회수</th>
											<td class="sidefont">170</td>
										</tr>

										<tr style="width: 100%;">
											<td colspan="4"><br> <br> <img src="img/bgimg.png" alt=""><br>
												<br></td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>

					</tbody>
				</table>
				<br>
				<table class="indextable">
					<tbody>
						<tr>
							<td><button>
									<strong class="fontind">목차</strong>
								</button></td>
						</tr>
					</tbody>
				</table>

				<br> <br>
				<div class="indexnb">
					<ul>
						<li><strong class="pagebf">이전글</strong> <a class="leftbr" href="#">블렉페퍼 닭가슴살 2+1</a></li>
						<br>
						<li class="liborder"></li>
						<br>
						<li><strong class="pagebf">다음글</strong> <a class="leftbr" href="#">파격세일! 반값@_@</a></li>
					</ul>
				</div>

				<!-- br대신 -->
				<table>
					<tbody>
						<tr>
							<td class="itbr"></td>
						</tr>
					</tbody>
				</table>
				<!-- br대신 -->
			</div>

			<!-- Footer Section Begin -->
			<jsp:include page="footer.jsp"></jsp:include>
			<!-- Footer Section End -->



			<!-- ì ìë ê¸°ë³¸ë°°ê²½ -->
			<script src="js/jquery-3.3.1.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/jquery.nice-select.min.js"></script>
			<script src="js/jquery-ui.min.js"></script>
			<script src="js/jquery.slicknav.js"></script>
			<script src="js/mixitup.min.js"></script>
			<script src="js/owl.carousel.min.js"></script>
			<script src="js/main.js"></script>
			<!-- ì ìë ê¸°ë³¸ë°°ê²½ -->
</body>
</html>