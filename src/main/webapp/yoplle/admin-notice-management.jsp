<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
											<td><a href="/web/yoplle/view.do?bno=${row.NOTI_NO}">${row.NOTI_TITLE}</a></td>
											<td><input value="${row.EMP_NO}" type="hidden">요플레</td>
											<td><fmt:formatDate value="${row.NOTI_DATE}"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td>${row.NOTI_HIT}</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
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