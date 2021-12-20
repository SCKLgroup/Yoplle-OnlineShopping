<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>
<head>
    <title>요리 플러스 레시피 | 요플레</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/detail-control-page.css" type="text/css">
</head>
<body>
	<div class="container container-jaeil-datail-control">
		<h3 class="table-title-jaeil">상품 관리 페이지</h3>
		<div class="table-btn-jaeil">
			<div class="category-number">전체 상품 수 : ?</div>
			<div class="btn-jaeil-update-set">
				<div class="category-jaeil">
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
				<form action="#" method="post">
					<input type="button" name="btn-primary update-jaeil" value="상품추가">
					<input type="button" name="btn-primary all-stop-jaeil" value="중지">
					<input type="button" name="btn-primary all-delete-jaeil" value="삭제">
				</form>
			</div>
		</div>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">대표 이미지</th>
						<th scope="col">카테고리</th>
						<th scope="col">제품명</th>
						<th scope="col">등록일자</th>
						<th scope="col">재고</th>
						<th scope="col">수정/삭제</th>
						<th scope="col">판매상태</th>
					</tr>
				</thead>
				<tbody>
					<tr class="center-tr">
						<th scope="row"><input type="radio" name="check-btn"></th>
						<td><img src="/website/ogani-master/img/breadcrumb.jpg" width="100px" height="100px"></td>
						<td>[채소]</td>
						<td>[채소] 싱싱한 토마토 1Kg</td>
						<td>2021/12/10</td>
						<td>10</td>
						<td>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-rewriter">수정</button>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-deleter">삭제</button>
						</td>
						<td>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-sell-start">시작</button>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-sell-stop">중지</button>
						</td>
					</tr>
					<tr class="center-tr">
						<th scope="row"><input type="radio" name="check-btn"></th>
						<td><img src="/website/ogani-master/img/breadcrumb.jpg" width="100px" height="100px"></td>
						<td>[채소]</td>
						<td>[채소] 싱싱한 토마토 1Kg</td>
						<td>2021/12/10</td>
						<td>10</td>
						<td>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-rewriter">수정</button>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-deleter">삭제</button>
						</td>
						<td>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-sell-start">시작</button>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-sell-stop">중지</button>
						</td>
					</tr>
					<tr class="center-tr">
						<th scope="row"><input type="radio" name="check-btn"></th>
						<td><img src="/website/ogani-master/img/breadcrumb.jpg" width="100px" height="100px"></td>
						<td>[채소]</td>
						<td>[채소] 싱싱한 토마토 1Kg</td>
						<td>2021/12/10</td>
						<td>10</td>
						<td>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-rewriter">수정</button>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-deleter">삭제</button>
						</td>
						<td>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-sell-start">시작</button>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-sell-stop">중지</button>
						</td>
					</tr>
					<tr class="center-tr">
						<th scope="row"><input type="radio" name="check-btn"></th>
						<td><img src="/website/ogani-master/img/breadcrumb.jpg" width="100px" height="100px"></td>
						<td>[채소]</td>
						<td>[채소] 싱싱한 토마토 1Kg</td>
						<td>2021/12/10</td>
						<td>10</td>
						<td>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-rewriter">수정</button>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-deleter">삭제</button>
						</td>
						<td>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-sell-start">시작</button>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-sell-stop">중지</button>
						</td>
					</tr>
					<tr class="center-tr">
						<th scope="row"><input type="radio" name="check-btn"></th>
						<td><img src="/website/ogani-master/img/breadcrumb.jpg" width="100px" height="100px"></td>
						<td>[채소]</td>
						<td>[채소] 싱싱한 토마토 1Kg</td>
						<td>2021/12/10</td>
						<td>10</td>
						<td>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-rewriter">수정</button>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-deleter">삭제</button>
						</td>
						<td>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-sell-start">시작</button>
							<button type="button" class="btn btn-sm btn-primary jaeil-detail-re-btn" id="btn-sell-stop">중지</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="jaeil-paging-control">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">4</a></li>
				<li class="page-item"><a class="page-link" href="#">5</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</div>
	</div>
</body>
</html>