<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>요리 플러스 레시피 | 요플레</title>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link href="css/listStyle.css" rel="stylesheet">
<!-- 임의 css -->
<!-- <style>
.addlist {
	padding: 0px 0px 10px 0px;
}
</style> -->

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<!--헤더 종료 부분 -->

	<section class="reciep_make_header" style="padding-left: 15%; padding-right: 15%">
		<h4>레시피수정자 : ${id}</h4>
		<div style="border-bottom: 4px solid black; padding-top: 30px"></div>

		<!-- 등록부분 시작 -->
		<form name="recipeModifyFrm" method="post" action="/web/modifyRecipeAction.do"
			enctype="multipart/form-data">
			<section style="padding: 30px 50px 30px 50px">
				<!-- 시계방향순 12시부터 -->
				<div style="padding-top: 50px">
					<h4 style="width: 25%; float: left">레시피 제목</h4>
					<input type="text" placeholder="${list.rpe_title }" value="${list.rpe_title }"
						style="width: 45%" id="recipe_title" name="rpe_title">
					<div style="width: 25%; height: 250px; float: right">
						<div style="width: 100%; height: 100%;">


							<img id="image_section" src="img/recipe/${list.rpe_img}" alt="your image"
								style="width: 100%; height: 100%" />

							<label className="input-file-button" for="imgInput" style="text-align: center;">
								이미지 선택
								<input type='file' id="imgInput" name="file" value="${list.rpe_img}">
								<!-- style="display: none;" -->
							</label>




							<input type="text" value="${list.rpe_no}" placeholder="${list.rpe_no}" name="rpeno">
							<%-- <input type="text" value="${listIngr.INGR_NO}" placeholder="${listIngr.INGR_NO}" name="ingrno"> --%>

						</div>

					</div>
				</div>



				<div style="padding-top: 50px">
					<h4 style="width: 25%; float: left">요리 소개</h4>
					<textarea type="text" placeholder="${list.rpe_content}" id="rpe_content" name="rpe_content"
						style="width: 45%; height: 200px">${list.rpe_content }</textarea>
				</div>

				<!-- <div style="padding-top: 50px">
				<h4 style="width: 25%; float: left">동영상</h4>
				<input type="text" placeholder="레시피에 대한 내용을 입력하세요" style="width: 400px;">
			</div> -->

				<div style="padding-top: 50px">
					<h4 style="width: 25%; float: left">카테고리</h4>
					<div style="width: 15%; float: left;">
						<select name="rpe_category" value="${list.rpe_category }">
							<option value="한식">한식</option>
							<option value="서양">서양</option>
							<option value="퓨전">퓨전</option>
							<option value="이탈리아">이탈리아</option>
							<option value="일본">일본</option>
						</select>
					</div>

				</div>

				<div style="padding-top: 80px">
					<div>
						<h4 style="width: 25%; float: left">조리 시간</h4>
						<div style="width: 50%; float: left;">
							<span style="float: left;"><input type="text" name="rpe_time" value="${list.rpe_time}">
							</span> <span style="float: left">분</span>
						</div>

					</div>
				</div>

				<div style="padding-top: 80px">
					<div>
						<h4 style="width: 25%; float: left">분량</h4>
						<div style="width: 15%; float: left;">
							<select name="rpe_quan">
								<option value="1인분">1인분</option>
								<option value="2인분">2인분</option>
								<option value="3인분">3인분</option>
								<option value="4인분">4인분</option>
							</select>
						</div>

					</div>
				</div>

				<div style="padding-top: 80px">
					<div>
						<h4 style="width: 25%; float: left">난이도</h4>
						<div style="width: 15%; float: left;">
							<select name="rpe_diff">
								<option value="초보환영">초보환영</option>
								<option value="보통">보통</option>
								<option value="어려움">어려움</option>
							</select>
						</div>

					</div>
				</div>


			</section>

			<div style="border-bottom: 2px solid black; padding: 30px 0px 50px 0px"></div>
			<!-- 등록부분 종료 -->

			<!-- 재료/양념-->
			<section style="padding: 30px 50px 30px 50px">





				<div style="padding-left: 100px; float: left; width: 80%">
					<div class="recipe__ingredients" style="position: relative; clear: both;">

						<table id="myTable" class="table">
							<thead>
								<tr class="active">
									<td class="text-center"><strong>번호</strong></td>
									<td class="text-center"><strong>재료</strong></td>
									<td class="text-center"><strong>수량</strong></td>
								</tr>
							</thead>
							<c:forEach var="i" items="${listIngr}" varStatus="cnt">
								<tbody id="tbody">
									<tr>

										<!-- //10/28====================================== -->
										<td class="text-center">${cnt.count}</td>
										<td class="text-center"><input type="text" placeholder="${i.INGR_NAME}"
												value="${i.INGR_NAME }" name="INGR_NAME"></td>
										<td class="text-center"><input type="text" placeholder="${i.INGR_QUAN}"
												value="${i.INGR_QUAN }" name="INGR_QUAN"></td>
										<td><input type="text" value="${i.INGR_NO}" id="ingrno" name="ingrno"></td>
									</tr>

								</tbody>
							</c:forEach>
						</table>

						<div style="text-align: center; padding: 10px">
							<button type="button" onclick="rowAdd()">추가</button>
							<button type="button" onclick="rowDel()">삭제</button>
						</div>

					</div>
				</div>
				</div>




			</section>
			<div style="border-bottom: 2px solid black; padding-top: 30px; clear: both;"></div>
			<!-- 재료/양념끝 -->

			<!-- 요리순서 -->
			<section style="padding: 30px 50px 30px 50px">

				<div style="padding-top: 50px; padding-bottom: 50px;">
					<h4 style="width: 25%;">요리순서</h4>
				</div>

				<div style="text-align: center; width: 100%;">


					<table id="myTable2" class="table">
						<thead>
							<tr class="active">
								<td class="text-center"><strong>번호</strong></td>
								<td class="text-center"><strong>요리방법</strong></td>
								<td class="text-center"><strong>첨부사진</strong></td>
							</tr>
						</thead>
						<c:forEach var="i" items="${listDe}" varStatus="cnt">
							<tbody id="tbody2">
								<tr>
									<td class="text-center" style="width: 10%">${cnt.count}</td>
									<td class="text-center" style="width: 130%"><textarea type="text"
											placeholder="${i.RPE_DE_CONTENT }" style="width: 90%; height: 100px"
											name="RPE_DE_CONTENT">${i.RPE_DE_CONTENT }</textarea></td>
									<td class="text-center"><input type="file" id="imgInput" name="files"
											value="${i.RPE_DE_IMG }"></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>

					<div style="text-align: center; padding: 10px">
						<button type="button" onclick="rowAdd_de()">추가</button>
						<button type="button" onclick="rowDel_de()">삭제</button>
					</div>


				</div>
			</section>
			<div style="padding-top: 30px"></div>

		</form>
		<!-- 요리순서끝 -->


		<section style="padding: 30px 50px 30px 50px">

			<div style="text-align: center; padding: 30px">

				<a id="submit">작성</a>

				<a onclick="location.href='/web/yoplle/recipeList.do?page=1&sort=lastest' ">취소</a>
			</div>
		</section>

		<jsp:include page="footer.jsp"></jsp:include>
</body>


<!-- script -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="./js/list.js"></script>


<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(function() {
		$("a#submit").click(function() {
			var ingrnoArr = [];
			ingrno = $
			{
				"[name=ingrno]"
			}
			$("form").submit();
		});

	});
	function rowAdd() {
		var trCnt = $('#myTable tr').length;
		if (trCnt < 11) {
			var innerHtml = "";
			innerHtml += '<tr>';
			innerHtml += '<td class="text-center">' + trCnt + '</td>';
			innerHtml += '<td class="text-center"><input type="text" name="INGR_NAME" placeholder="'+trCnt+'번재료"></td>';
			innerHtml += '<td class="text-center"><input type="text" name="INGR_QUAN" placeholder="수량"></td>';
			innerHtml += '</tr>';

			$('#myTable > tbody:last').append(innerHtml);
		} else {
			alert("최대 10개");
			return false;
		}
	}

	function rowDel() {
		var trCnt = $('#myTable tr').length;
		if (trCnt > 2) {
			$('#myTable > tbody:last > tr:last').remove();
		} else {
			return false;
		}
	}

	function rowAdd_de() {
		var trCnt2 = $('#myTable2 tr').length;
		if (trCnt2 < 11) {
			var innerHtml = "";
			innerHtml += '<tr>';
			innerHtml += '<td class="text-center">' + trCnt2 + '</td>';
			innerHtml += '<td class="text-center" style="width:130%">';
			innerHtml += '<textarea type="text" placeholder="' + trCnt2
					+ '번 방법"';
			innerHtml += 'style="width: 90%; height: 100px" name="RPE_DE_CONTENT"></textarea></td>';
			innerHtml += '<td class="text-center"><input type="file" id="imgInput" name="files"></td>';
			innerHtml += '</tr>';

			$('#myTable2 > tbody:last').append(innerHtml);
		} else {
			alert("최대 10개");
			return false;
		}
	}

	function rowDel_de() {
		var trCnt2 = $('#myTable2 tr').length;
		if (trCnt2 > 2) {
			$('#myTable2 > tbody:last > tr:last').remove();
		} else {
			return false;
		}
	}
	//추가부분
	function readURL(input) {

		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#image_section').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}

	}

	// 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
	$("#imgInput").change(function() {
		readURL(this);
	});
</script>



</html>