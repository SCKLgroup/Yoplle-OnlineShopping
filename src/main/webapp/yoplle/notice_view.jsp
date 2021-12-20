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

<link rel="stylesheet" href="css/writer-page.css" type="text/css">
</head>
<body>
	<div class="container container-jaeil-writer" role="main">	
		<h2>공지사항 상세</h2>
		<form name="form2" method="post">
			<div class="mb-3">
				<label class="detail-title">작성일자</label> <span class="form-control"
					style="margin: 0 12% 0 0; padding: 0 1.15% 0 1.15%"> <fmt:formatDate
						value="${dto.NOTI_DATE}" pattern="yyyy-MM-dd a HH:mm:SS" />
				</span>
			</div>

			<div class="mb-3">
				<label for="detail-title">조회수</label> <input type="text"
					class="form-control" value="${dto.NOTI_HIT}">
			</div>

			<div class="mb-3">
				<label for="detail-title">공지 제목</label> <input type="text"
					class="form-control" name="NOTI_TITLE" id="title"
					value="${dto.NOTI_TITLE}" placeholder="제목을 입력해주세요">
			</div>

			<div class="mb-3">
				<label for="detail-origin">작성자</label> <input type="text"
					class="form-control" value="요플레" disabled="disabled"> <input
					type="hidden" name="EMP_NO" id="writer" value="${dto.EMP_NO}"
					value="1">
			</div>
			<div class="mb-3">
				<label for="content">공지내용</label>
				<textarea class="form-control" rows="5" name="NOTI_CONTENT"
					id="content" placeholder="내용을 입력해 주세요">${dto.NOTI_CONTENT}</textarea>
			</div>
			<div class="mb-3">
				<label for="detail-imgfile">파일 업로드</label><br> <input
					type="file" name="form-control" name="detail-file" id="detail-file">
			</div>
			<div class="detail-writer-btn">
				<input type="hidden" name="NOTI_NO" value="${dto.NOTI_NO}">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
			</div>
		</form>
	</div>

	<script>
		$(document).ready(function() {
			$("#btnDelete").click(function() {
				if (confirm("삭제하시겠습니까?")) {
					document.form2.action = "/web/yoplle/delete.do";
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
				document.form2.action = "/web/yoplle/update.do";
				document.form2.submit();
			});
		});
	</script>

</body>
</html>

