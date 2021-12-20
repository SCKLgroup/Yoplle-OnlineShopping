<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>요리 플러스 레시피 | 관리자</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<!--  <link href="css/sb-admin-2.min.css" rel="stylesheet"> -->
<link href="css/sb-admin-2.css" rel="stylesheet">
<link href="css/detail-control-page.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

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

					<div class="container container-jaeil-datail-control">
						<h2>공지사항 작성</h2>
						<form name="form1" method="post" action="insert.do">
							<div class="mb-3">
								<label for="detail-title">공지 제목</label> <input type="text"
									class="form-control" name="NOTI_TITLE" id="title"
									placeholder="제목을 입력해주세요">
							</div>

							<div class="mb-3">
								<label for="detail-origin">작성자</label> <input type="text"
									class="form-control" value="요플레" disabled="disabled"></input> <input
									type="hidden" name="EMP_NO" id="writer" value="1"></input>
							</div>

							<div class="mb-3">
								<label for="contents">공지내용</label>
								<textarea class="form-control" rows="5" name="NOTI_CONTENT"
									id="contents" placeholder="내용을 입력해 주세요"></textarea>
							</div>
							<div class="mb-3">
								<label for="detail-imgfile">파일 업로드</label><BR> <input
									type="file" name="NOTI_IMG" id="file"
									style="margin-bottom: 20px" />
								<div class="select_img">
									<img src="" />
								</div>
								<%=request.getRealPath("/")%>
							</div>
							<div class="detail-writer-btn">
								<button type="button" class="btn btn-sm btn-primary"
									id="btnSave">저장</button>
								<button type="reset" class="btn btn-sm btn-primary">취소(다시작성)</button>
							</div>

						</form>
					</div>
				</div>

				<!-- /.container-fluid -->

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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
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
	<script src="js/datatables-demo.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnSave").click(function() {
				var title = $("#title").val();
				var content = $("#contentY").val();
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