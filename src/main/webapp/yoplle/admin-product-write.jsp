<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>요리 플러스 레시피 | 관리자</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
   <!--  <link href="css/sb-admin-2.min.css" rel="stylesheet"> -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		<jsp:include page="admin-sidebar.jsp" />

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				<jsp:include page="admin-topbar.jsp" />
                <!-- Begin Page Content -->
                <div class="container-fluid">
	<div class="container container-jaeil-writer" role="main">
		<h2>상품 상세 페이지 작성</h2>
		<form name="form" id="form" role="form" method="post" action="insertItem.do"
			enctype="multipart/form-data">
			<div class="mb-3">
				<label for="detail-title">상품 제목</label>
				<input type="text" class="form-control" name="item_name" id="item_name"
					placeholder="상품 제목을 입력해 주세요">
			</div>
			<div class="mb-3">
				<select name="item_category" class="selectpicker" aria-label="Default select example">
					<option selected>전체 카테고리</option>
					<optgroup label="채소/과일">
						<option value="채소">채소</option>
						<option value="과일">과일</option>
					</optgroup>
					<optgroup label="육류/계란">
						<option value="육류계란">육류계란</option>
					</optgroup>
					<optgroup label="냉동/냉장">
						<option value="냉동식품">냉동식품</option>
					</optgroup>
					<optgroup label="소스/오일">
						<option value="소스">소스</option>
					</optgroup>
				</select>
			</div>
			<div class="mb-3">
				<label for="detail-volum">판매할용량및수량</label>
				<input type="text" class="form-control" name="item_ea" id="item_ea" placeholder="용량을 입력해 주세요">
			</div>

			<div class="mb-3">
				<label for="detail-volum">재고수량</label>
				<input type="text" class="form-control" name="item_stock" id="item_stock"
					placeholder="용량을 입력해 주세요">
			</div>
			<div class="mb-3">
				<label for="detail-origin">원산지</label>
				<input type="text" class="form-control" name="item_origin" id="item_origin"
					placeholder="원산지를 입력해 주세요">
			</div>

			<div class="mb-3">
				<label for="detail-origin">가격</label>
				<input type="text" class="form-control" name="item_price" id="item_price" placeholder="가격만 입력">
			</div>
			<div class="mb-3">
				<label for="content">세부 카테고리</label>
				<input type="text" class="form-control" name="item_ca_de" id="item_ca_de"
					placeholder="검색될 세부 카테고리 이름 ex)오이오이">
			</div>
			<div class="mb-3">
				<label for="detail-imgfile">상품 썸네일 이미지</label>
				<br>
				<input type="file" name="thumbnail" id="item_img">
				<div>
					<img id="image_section" src="img/recipe/normal.png" alt="your image"
						style="width: 10%; height: 10%" />
				</div>

			</div>

			<div class="mb-3">
				<label for="detail-imgfile">상품상세 설명 이미지</label>
				<br>
				<input type="file" name="detail" id="item_de_content">
				<div>
					<img id="image_section2" src="img/recipe/normal.png" alt="your image"
						style="width: 10%; height: 10%" />
				</div>
			</div>
		</form>
		<div class="detail-writer-btn">
			<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
			<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
		</div>
	</div>

            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

	
<script type="text/javascript">
	$("button#btnSave").click(function() {
		$('form').submit();
	});

	function readURL(input) {

		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#image_section').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}

	}

	function readURL2(input) {

		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#image_section2').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}

	}

	// 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
	$("#item_img").change(function() {
		readURL(this);
	});

	$("#item_de_content").change(function() {
		readURL2(this);
	});
</script>
</body>

</html>