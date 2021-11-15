<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>
<head>
    <title>요리 플러스 레시피 | 요플레</title>
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


<script>
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});
	$(document).on(
					'click',
					'#btnList',
					function(e) {
						e.preventDefault();
						location.href = "${pageContext.request.contextPath}/board/getBoardList";
					});
</script>
<link rel="stylesheet" href="css/writer-page.css" type="text/css">
</head>
<body>
	<div class="container container-jaeil-writer" role="main">
		<h2>상품 상세 페이지 작성</h2>
		<form name="form" id="form" role="form" method="post"
			action="${pageContext.request.contextPath}/board/saveBoard">
			<div class="mb-3">
				<label for="detail-title">상품 제목</label>
				<input type="text" class="form-control" name="detail-title" id="detail-title"
					placeholder="상품 제목을 입력해 주세요">
			</div>
			<div class="mb-3">
				<select class="selectpicker" aria-label="Default select example">
					<option selected>전체 카테고리</option>
					<optgroup label="채소/과일">
						<option value="채소">채소</option>
						<option value="과일">과일</option>
					</optgroup>
					<optgroup label="육류">
						<option value="돼지고기">돼지고기</option>
						<option value="소고기">소고기</option>
						<option value="닭/오리">닭/오리</option>
						<option value="계란">계란</option>
					</optgroup>
					<optgroup label="수산물">
						<option value="생선류">생선류</option>
						<option value="수산물">수산물</option>
						<option value="건어물">건어물</option>
					</optgroup>
					<optgroup label="냉동/냉장">
						<option value="햄/소시지/베이컨">햄/소시지/베이컨</option>
						<option value="단무지/어묵/맛살/유부">단무지/어묵/맛살/유부</option>
						<option value="냉동식품">냉동식품</option>
						<option value="냉장식품">냉장식품</option>
					</optgroup>
					<optgroup label="물/음료">
						<option value="생수/탄산수">생수/탄산수</option>
						<option value="음료">음료</option>
					</optgroup>
					<optgroup label="간편식">
						<option value="면">면</option>
						<option value="통조림">통조림</option>
						<option value="라면">라면</option>
					</optgroup>
					<optgroup label="소스/오일">
						<option value="조미료">조미료</option>
						<option value="식용유/오일">식용유/오일</option>
						<option value="소스">소스</option>
					</optgroup>
					<optgroup label="간식">
						<option value="과자">과자</option>
						<option value="빵">빵</option>
						<option value="잼">잼</option>
					</optgroup>
				</select>
			</div>
			<div class="mb-3">
				<label for="detail-volum">용량</label>
				<input type="text" class="form-control" name="detail-volum" id="detail-volum"
					placeholder="용량을 입력해 주세요">
			</div>
			<div class="mb-3">
				<label for="detail-origin">원산지</label>
				<input type="text" class="form-control" name="detail-origin" id="detail-origin"
					placeholder="원산지를 입력해 주세요">
			</div>
			<div class="mb-3">
				<label for="content">안내사항</label>
				<textarea class="form-control" rows="5" name="content" id="content"
					placeholder="안내할 내용을 입력해 주세요"></textarea>
			</div>
			<div class="mb-3">
				<label for="detail-imgfile">파일 업로드</label><br>
				<input type="file" name="form-control" name="detail-file" id="detail-file">
			</div>
		</form>
		<div class="detail-writer-btn">
			<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
			<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
		</div>
	</div>
</body>
</html>

