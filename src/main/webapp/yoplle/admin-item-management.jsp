<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>


<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>요리 플러스 레시피 | 관리자</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">


    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="css/detail-control-page.css" rel="stylesheet">

</head>

<body id="page-top">

    <div id="wrapper">
		<jsp:include page="admin-sidebar.jsp" />
       		<div id="content-wrapper" class="d-flex flex-column">
            	<div id="content">
					<jsp:include page="admin-topbar.jsp" />
                
                  <!-- Begin Page Content -->
                <div class="container-fluid">

                    <div class="container container-jaeil-datail-control">
					<h3 class="table-title-jaeil">상품 관리 페이지</h3>
					<div class="table-btn-jaeil">
						<div class="category-number"></div>
						<div class="btn-jaeil-update-set">
							<div class="category-jaeil">
								<select class="selectpicker" aria-label="Default select example" onchange="selectAjax()">
									<option value="default" selected>전체 카테고리</option>
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
							<form action="#" method="post">
								<input type="button" name="btn-primary update-jaeil" value="상품추가">
								<input type="button" name="btn-primary all-stop-jaeil" value="중지">
								<input type="button" name="btn-primary all-delete-jaeil" id="allclear" value="삭제">
							</form>
						</div>
					</div>
					<div>
						<table class="table">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" name="all-check-btn" id="allcheckItem"></th>
									<th scope="col">대표 이미지</th>
									<th scope="col">카테고리</th>
									<th scope="col">제품명</th>
									<th scope="col">등록일자</th>
									<th scope="col">재고</th>
									<th scope="col">수정/삭제</th>
									<th scope="col">판매상태</th>
								</tr>
							</thead>
							<tbody id="tbList">
							
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
                        <span aria-hidden="true">Ã</span>
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
    
   	<script type="text/javascript">
   	
   		ajaxDate('/web/adminList.do', {"job":"default"},'json'); // 기본 출력
   		
   		function selectAjax(){
   			ajaxDate('/web/adminList.do', {"job":$(".selectpicker option:selected").val()}, 'json');
   		}
   		
   		
   		function ajaxDate(url, data, dataType){ // ajax로 출력하기
   	 	 $.ajax({
   			url:url,
   			data:data,
   			dataType:dataType,
   			success:function(v){
   				adminList(v); // 출력 함수
   				console.log(v);
   			},
   			error:function(e){
   				alert('error!!'+e);
   			}
   		});
   	 }
   		
   		function adminList(v){ // ajax로 해당 카테고리별 상품 리스트 출력하는 함수
   			var temp="";
   			$.each(v.item, function(index, dom){
   				temp+="<tr class=\"center-tr\">";
   				temp+="<th scope=\"row\"><input type=\"checkbox\" name=\"check-btn\" class=\"checkitemset\" id=\""+dom.item_no+"\"></th>";
				temp+="<td><img src=\""+dom.item_img+"\" width=\"100px\" height=\"100px\"></td>";
				temp+="<td>["+dom.item_category+"]</td><td width=\"300px\">["+dom.item_category+"]"+dom.item_name+"</td><td>"+dom.item_date+"</td><td>"+dom.item_stock+"</td><td>";
				temp+="<button type=\"button\" class=\"btn btn-sm btn-primary jaeil-detail-re-btn\" id=\"btn-rewriter\">수정</button>";
				temp+="<button type=\"button\" class=\"btn btn-sm btn-primary jaeil-detail-re-btn\" id=\"btn-deleter\" onclick=\"itemDel("+dom.item_no+")\">삭제</button>";
				
				temp+="</td>";
				temp+="<td>";
				temp+="<button type=\"button\" class=\"btn btn-sm btn-primary jaeil-detail-re-btn\" id=\"btn-sell-start\">시작</button>";
				temp+="<button type=\"button\" class=\"btn btn-sm btn-primary jaeil-detail-re-btn\" id=\"btn-sell-stop\">중지</button></td></tr>";
   			});
   			$("#tbList").html(temp); // 아이디가 tbList인 태그 하위에 temp를 추가
   			$(".category-number").text('전체 상품 수 : '+v.count);
   		}
   		
   		function itemDel(itemNo){ // 단일 상품을 삭제할 시, 이미 ajax로 생성된 버튼을 클릭함
   			var list=new Array();
   			if(confirm("상품을 삭제하시겠습니까?") == true){
   				list.push(itemNo);
   				ajaxDate('/web/deleteItem.do', {
   	   				"job":$(".selectpicker option:selected").val(),
   	   				"no":list
   	   				}, 'json');
		   	    }else { //취소
		   	         return false;
		   	    }
   		}
   		
   		$("#allcheckItem").click(function(){ // 전체 선택, 전체 선택 해제
   			
   			if($(this).is(":checked")){ 
   		    	$("input[type=checkbox]").prop("checked", true);
   		    }else{ 
   		    	$("input[type=checkbox]").prop("checked", false);
   		    }
   		});
   		
   		$('#allclear').click(function(){ // 선택 삭제 버튼을 클릭할 시,
   			var list=new Array();
   			$(".checkitemset").each(function(index, item){
   				if($(item).is(":checked")==true){ // 체크 상태인 item_no를 받음
   					list.push($(item).attr("id")); // list에 아이템 넘버 추가
   				}
   			});
   			if(confirm("상품을 삭제하시겠습니까?") == true){
   				ajaxDate('/web/deleteItem.do', {
   	   				"job":$(".selectpicker option:selected").val(),
   	   				"no":list // list에 추가된 아이템 넘버를 넘겨줌
   	   				}, 'json');
		   	    }else { //취소
		   	         return false;
		   	    }
   		});
   		
   	</script>

</body>


</html>