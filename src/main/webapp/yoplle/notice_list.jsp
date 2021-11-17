<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>



<html>

<head>

<meta charset="UTF-8">



<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>



<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>요플레 | 상세 페이지 글 작성</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/util.css">

<link rel="stylesheet" href="css/writer-page.css" type="text/css">
</head>
<body>
	<div class="container container-jaeil-writer" role="main">
		<div class="content">
			<div class="container">
				<h2 class="noticeTitle">공지사항 List</h2>

				<!-- 	<div style="text-align: right; margin-bottom: 20px;" id="delBtn"
				class="delBtn">
				<button type="button" class="primary-btn selectDelete_btn">삭제</button>
			</div> -->

				<div style="text-align: right; margin-bottom: 20px;">
					<button type="button" id="btnWrite" class="primary-btn">공지작성</button>
				</div>

				<div class="table-responsive">
					<table class="table custom-table">
						<thead>
							<tr>
								<th scope="col"><label for="allCheck"
									class="control control--checkbox"></label><input
									type="checkbox" name="allCheck" id="allCheck"
									class="js-check-all tableTextPos" /></th>
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
									<td><input type="checkbox" id="chBox"
										class="js-check-all chBox" data-noticeNom="${row.NOTI_NO}" /></td>
									<td>${row.NOTI_NO}</td>
									<td><a href="/yoplle/view.do?bno=${row.NOTI_NO}">${row.NOTI_TITLE}</a></td>
									<td><input value="${row.EMP_NO}" type="hidden">요플레</td>
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

	</div>


	<script>
		$(document).ready(function() {
			$("#btnWrite").click(function() {
				location.href = "write.do"
			});
		});
	</script>

	<!-- CheckBox -->
	<script>
		$("#allCheck").click(function() {
			var chk = $("#allCheck").prop("checked");
			if (chk) {
				$(".chBox").prop("checked", true);
			} else {
				$(".chBox").prop("checked", false);
			}
		});
	</script>
	<script>
		$(".chBox").click(function() {
			$("#allCheck").prop("checked", false);
		});
	</script>
	<!-- CheckBox -->

	<script>
		$(".selectDelete_btn").click(function() {
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			if (confirm_val) {
				var checkArr = new Array();
				$("input[id='chBox']:checked").each(function() {
					alert("3");
					checkArr.push($(this).attr("data-noticeNom"));
				});
				jax({
					url : "delete.do",
					type : "post",
					data : {
						chbox : checkArr
					},
					success : function() {
						location.href = "list.do";
					}
				});
			}
		});
	</script>

</body>
</html>

