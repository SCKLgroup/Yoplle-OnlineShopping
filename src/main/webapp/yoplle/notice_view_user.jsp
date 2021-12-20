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
			<form name="form2" method="post">

				<div style="width: 100%;">
					<strong class="tableTextString">작성일자</strong> <span
						class="tableInDt3"
						style="margin: 0 12% 0 0; padding: 0 1.15% 0 1.15%"> <fmt:formatDate
							value="${dto.NOTI_DATE}" pattern="yyyy-MM-dd a HH:mm:SS" />
					</span> <strong style="margin: 0 10% 0 10%;">조회수</strong> <span
						class="tableInDt4">${dto.NOTI_HIT}</span>
				</div>

				<div class="tableIndexWidth" style="margin-top: 1.5%;">
					<strong>제목</strong>
					<div class="tableIndexDt">
						<input class="tableInDt" name="NOTI_TITLE" id="title" size="80"
							value="${dto.NOTI_TITLE}" readonly>
					</div>
				</div>

				<div class="tableIndexWidth">
					<strong>내용</strong>
					<div class="tableIndexDt">
						<textarea readonly name="NOTI_CONTENT" id="content" rows="10"
							cols="80" placeholder="내용을 입력해주세요" class="tableInDt">${dto.NOTI_CONTENT}</textarea>
					</div>
				</div>

				<div style="width: 100%;">
					<strong class="tableTextString">작성자</strong> <span
						class="tableInDt4">요플레</span> <input type="hidden" name="EMP_NO"
						id="writer" value="${dto.EMP_NO}" size="80" value="1"
						class="tableInDt2">
				</div>

				<div style="width: 100%; margin-top: 3%; display: none;">
					<span class="tableInDt4"> <img
						src="${dto.NOTI_IMG}" style="width: 100%;height: auto;">
					</span>
				</div>

				<div
					style="text-align: center; margin-bottom: 20px; margin-top: 20px;">
					<input type="hidden" name="NOTI_NO" value="${dto.NOTI_NO}" /> <input
						type="hidden" id="btnUpdate" class="tableBtnSave" /> <input
						type="hidden" id="btnDelete" class="tableBtnReset" />
				</div>

			</form>


			<!--  -->
			<!-- <br>
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
			</div>-->
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
	<script>
		$(document).ready(function() {
			$("#btnDelete").click(function() {
				if (confirm("삭제하시겠습니까?")) {
					document.form2.action = "/yoplle/delete.do";
					document.form2.submit();
				}
			});
			$("#btnUpdate").click(function() {
				var title = $("#title").val();
				var content = $("#content").val();
				var writer = $("#writer").val();
				if (title == "") {
					alert("제목을 입력하세요");
					document.form2.title.focus();
					return;
				}
				if (content == "") {
					alert("내용을 입력하세요");
					document.form2.content.focus();
					return;
				}
				if (writer == "") {
					alert("작성자를 입력하세요");
					document.form2.writer.focus();
					return;
				}
				document.form2.action = "/yoplle/update.do";
				document.form2.submit();
			});
		});
	</script>
</body>
</html>