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

	<jsp:include page="header.jsp" />
	<!-- Header Section End -->

	<!-- Hero Section Begin -->


	<!-- 테이블 -->
	<div class="content">
		<div class="container">
			<h2 class="noticeTitle">공지사항 작성</h2>
			<div style="width: 100%;">
				<form name="form1" method="post" action="/yoplle/insert.do">

					<div class="tableIndexWidth">
						<strong>제목</strong>
						<div class="tableIndexDt">
							<input class="tableInDt" name="NOTI_TITLE" id="title" size="80"
								placeholder="제목을 입력해주세요">
						</div>
					</div>

					<div class="tableIndexWidth">
						<strong>내용</strong>
						<div class="tableIndexDt">
							<textarea class="tableInDt" name="NOTI_CONTENT" id="content"
								rows="20" cols="80" placeholder="내용을 입력해주세요"></textarea>
						</div>
					</div>

					<div style="width: 100%;">
						<strong class="tableTextString">작성자</strong> 
						<span class="tableInDt4">요플레</span>
						<input type="hidden" name="EMP_NO"
							id="writer" size="80" value="1" class="tableInDt2">
					</div>
					
					<div style="text-align: center; margin-bottom: 20px; margin-top: 20px;">
						<button type="button" id="btnSave" class="tableBtnSave">확인</button>
						<button type="reset" class="tableBtnReset">취소</button>
					</div>
				</form>
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
		</div>
	</div>

	<!--  -->
	<div></div>
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
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnSave").click(function() {
				var title = $("#title").val();
				var content = $("#content").val();
				var writer = $("#writer").val();
				if (title == "") {
					alert("제목을 입력하세요");
					document.form1.title.focus();
					return;
				}
				if (content == "") {
					alert("내용을 입력하세요");
					document.form1.content.focus();
					return;
				}
				if (writer == "") {
					alert("작성자를 입력하세요");
					document.form1.writer.focus();
					return;
				}
				document.form1.submit();
				console.log("작성확인 완료");
			});
		});
	</script>
</body>
</html>