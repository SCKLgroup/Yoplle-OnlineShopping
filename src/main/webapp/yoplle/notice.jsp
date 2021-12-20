<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

	<!-- Header Section End -->
	<jsp:include page="header.jsp" />
	<!-- Hero Section Begin -->
	<!-- 테이블 -->
	<div class="content">
		<div class="container">
			<h2 class="noticeTitle">공지사항</h2>
			<div class="table-responsive">
				<table class="table custom-table">
					<thead>
						<tr>
							<th scope="col" class="il-tableno">번호</th>
							<th scope="col" class="il-tabletitle">제목</th>
							<th scope="col" class="il-tablename">작성자</th>
							<th scope="col" class="il-tabledate">작성일</th>
							<th scope="col" class="il-tablehit">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var='row' items="${list}">
							<tr class="tableTextPos">
								<td>${row.NOTI_NO}</td>
								<td><a href="/web/yoplle/view2.do?bno=${row.NOTI_NO}">${row.NOTI_TITLE}</a></td>
								<td><input value="${row.EMP_NO}" type="hidden"> 요플레</td>
								<td><fmt:formatDate value="${row.NOTI_DATE}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>${row.NOTI_HIT}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>


			<!--  -->
			<br>
			<div class="col-md-8">
				<ul class="pagination">
					<li><a href="#">&lt;</a></li>
					<li><a href="#">1</a></li>
					<li class="active"><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">...</a></li>
					<li><a href="#">19</a></li>
					<li><a href="#">&gt;</a></li>
				</ul>
			</div>
			<br> <br> <br> <br>
			<!--  -->
		</div>

	</div>

	<!--  -->

	<!-- Footer Section Begin -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Footer Section End -->

	<!-- íì´ë¸ -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
	<!-- íì´ë¸ -->

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