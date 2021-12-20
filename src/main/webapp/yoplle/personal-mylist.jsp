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
								<li><a id="mypage" href="#">개인정보수정</a></li>
								<li><a href="mypagelist.do">마이 레시피</a></li>

							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-7">

					<div class="form-basic">
						<form id="list1" method="post" action="mypage.do">
							<input type="text" value="${id}" name="id" hidden="hidden">
						</form>
						<div class="form-title-row">
							<h1>마이 레시피</h1>
						</div>
						<div class="container container-jaeil-datail-control">

							<div>

								<table class="table">
									<thead>
										<tr>

											<th scope="col">썸네일</th>
											<th scope="col">제목</th>
											<th scope="col">좋아요</th>
											<th scope="col">조회수</th>
											<th scope="col">날짜</th>
										</tr>
									</thead>
									<tbody id="tbList">
										<form id="myrecipelist" method="post" action="myrecipe.do">
											<c:forEach var="i" items="${recipe}" varStatus="cnt">
												<tr class="center-tr">
													<td style="vertical-align: middle;"><a id="imgToList" href="#" data-rpe_no="${i.rpe_no}">
															<img src="${i.rpe_img}" style="width: 80px; height: 80px">
														</a></td>
													<td style="vertical-align: middle;"><a id="titleToList" href="#"
															data-rpe_no="${i.rpe_no}">${i.rpe_title }</a></td>
													<!-- data-rpe_no  -->
													<td style="vertical-align: middle;">${i.rpe_like }개</td>
													<td style="vertical-align: middle;">${i.rpe_hit }</td>
													<td style="vertical-align: middle;">${i.rpe_date }</td>

												</tr>

											</c:forEach>
											<input id="rpeno" type="hidden" name="rpe_no">
										</form>

									</tbody>
								</table>

							</div>
						</div>
					</div>

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
			$("a#mypage").click(function() {
				$("form#list1").submit();
			});

			$("a#imgToList").click(function() {
				$("input#rpeno").val($(this).data("rpe_no")); //jquery data값 저장
				$("form#myrecipelist").submit();
			});

			$("a#titleToList").click(function() {
				$("input#rpeno").val($(this).data("rpe_no")); //jquery data값 저장
				$("form#myrecipelist").submit();
			});

		});
	</script>



</body>

</html>