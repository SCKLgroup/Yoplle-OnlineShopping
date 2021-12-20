<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<h2>공지사항 작성</h2>
		<form name="form1" method="post" action="insert.do" >
			<div class="mb-3">
				<label for="detail-title">공지 제목</label> <input type="text"
					class="form-control" name="NOTI_TITLE" id="title"
					placeholder="제목을 입력해주세요">
			</div>

			<div class="mb-3">
				<label for="detail-origin">작성자</label> <input type="text"
					class="form-control" value="요플레" disabled="disabled"> <input
					type="hidden" name="EMP_NO" id="writer" value="1">
			</div>
			<div class="mb-3">
				<label for="content">공지내용</label>
				<textarea class="form-control" rows="5" name="NOTI_CONTENT"
					id="content" placeholder="내용을 입력해 주세요"></textarea>
			</div>
			<div class="mb-3">
				<label for="detail-imgfile">파일 업로드</label><BR> <input
					type="file" name="NOTI_IMG" id="file"  style="margin-bottom: 20px"/>
				<div class="select_img">
					<img src="" />
				</div>
				<%=request.getRealPath("/") %>
			</div>
			<div class="detail-writer-btn">
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="reset" class="btn btn-sm btn-primary">취소(다시작성)</button>
			</div>
		</form>
	</div>


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
	<script>
		$("#file")
				.change(
						function() {
							if (this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data) {
									$(".select_img img").attr("src",
											data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
	</script>

</body>
</html>

