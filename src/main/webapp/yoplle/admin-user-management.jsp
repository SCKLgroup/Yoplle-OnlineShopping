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
    <link href="css/detail-control-page.css" rel="stylesheet">

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
				<div class="container container-jaeil-datail-control">
					<h3 class="table-title-jaeil">회원 관리</h3>
					<div class="table-btn-jaeil">
						<div class="category-number" id="countUser"></div>
						<div class="btn-jaeil-update-set">
							<div class="category-jaeil"></div>
							<form action="#" method="post">
								<input type="button" name="btn-primary all-delete-jaeil" id="chooseDel" value="선택 삭제">
							</form>
						</div>
					</div>
					<div>
						<table class="table">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" id="allCheck"></th>
									<th scope="col">회원번호
										<a onclick="sortAjax('/web/userList.do', {'job':'user_no','sort':'asc'});">↑</a>
										<a onclick="sortAjax('/web/userList.do', {'job':'user_no','sort':'desc'});">↓</a></th>
									<th scope="col">아이디
										<a onclick="sortAjax('/web/userList.do', {'job':'user_id','sort':'asc'});">↑</a>
										<a onclick="sortAjax('/web/userList.do', {'job':'user_id','sort':'desc'});">↓</a></th>
									<th scope="col">이름
										<a onclick="sortAjax('/web/userList.do', {'job':'user_name','sort':'asc'});">↑</a>
										<a onclick="sortAjax('/web/userList.do', {'job':'user_name','sort':'desc'});">↓</a></th>
									<th scope="col">성별
										<a onclick="sortAjax('/web/userList.do', {'job':'user_gender','sort':'asc'});">↑</a>
										<a onclick="sortAjax('/web/userList.do', {'job':'user_gender','sort':'desc'});">↓</a></th>
									<th scope="col">생년월일
										<a onclick="sortAjax('/web/userList.do', {'job':'user_birth','sort':'asc'});">↑</a>
										<a onclick="sortAjax('/web/userList.do', {'job':'user_birth','sort':'desc'});">↓</a></th>
									<th scope="col">가입날짜
										<a onclick="sortAjax('/web/userList.do', {'job':'user_date','sort':'asc'});">↑</a>
										<a onclick="sortAjax('/web/userList.do', {'job':'user_date','sort':'desc'});">↓</a></th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
							<tbody id="tbList"></tbody>
						</table>
						<input type="hidden" id="jobVal" value="">
						<input type="hidden" id="sortVal" value="">
					</div>
	            </div>
	
	            <!-- Footer -->
	            <footer class="sticky-footer bg-white">
	                <div class="container my-auto">
	                    <div class="copyright text-center my-auto">
	                        <span>Copyright &copy; Your Website 2020</span>
	                    </div>
	                </div>
	            </footer>
	        </div>
		</div>
	</div>
</div>
   

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    <script src="js/datatables-demo.js"></script>

<script type="text/javascript">

	//페이지 클릭 시 바로 리스트 출력
	sortAjax('/web/userList.do',{}); 
	
	//회원 정보 정렬 Ajax
	function sortAjax(url,data,dataType){
	     $.ajax({
	          url:url,
	          type:'POST',
	          data:data,
	          dataType:'json',              
	          success:function(v){
	        	 ajaxUserList(v);
	          },
	          error:function(e){
	             alert('error'+e);
	          }
	       });   
	 }
	function ajaxUserList(v){
	   var temp="";
	    $.each(v.userList,function(index,dom){
	    	temp+="<tr class=\"center-tr\">";
			temp+="<th scope=\"row\"><input type=\"checkbox\" name=\"check-btn\"></th>";
	    	temp+=" <td>"+dom.user_no+"</td>";
	     	temp+=" <td>"+dom.user_id+"</td>";
	    	temp+=" <td>"+dom.user_name+"</td>";
	    	temp+=" <td>"+dom.user_gender+"</td>";
	   		temp+=" <td>"+dom.user_birth+"</td>";
	   		temp+=" <td>"+dom.user_date+"</td>";
	   		temp+="<td><button type=\"button\" class=\"btn btn-sm btn-primary jaeil-detail-re-btn\" id=\"btn-deleter\" onclick=\"userDel('"+dom.user_no+"')\">삭제</button>";
	   		temp+=" </td>";
	   		temp+=" </tr>";
	    });
	    var count="전체 회원 수 : "+v.countUser+"명"
	    $("tbody#tbList").html(temp);
	    $("div#countUser").html(count);
	    $("input#jobVal").val(v.job);
	    $("input#sortVal").val(v.sort);
	} 

	//회원 삭제 버튼 클릭: 회원 삭제 후 다시 회원 정렬
	function userDel(userNo){
	  	if (confirm("회원을 삭제하시겠습니까?") == true) { //확인
	  		sortAjax('/web/userDelete.do',
	    			 {"no":userNo,
	  				  "job":$("input#jobVal").val(),
	  				  "sort":$("input#sortVal").val()});
	    }else { //취소
	         return false;
	    }
	}
	
	//전체 체크(체크 박스) 클릭: 전체 체크 
	$("#allCheck").click(function(){
	    if($(this).is(":checked")){ 
	    	$("input[type=checkbox]").prop("checked", true);
	    }else{ 
	    	$("input[type=checkbox]").prop("checked", false);
	    }
	});
	
	//선택 삭제 클릭: 체크된 회원정보를 list로 넘겨줌
	$("button#chooseDel").on("click",function(){
		var list = new Array();
		
		$("input[type=checkbox]").each(function() {
			list.push($(item).attr('id'));
        });
		console.log(list)
	});
	
</script>

</body>

</html>