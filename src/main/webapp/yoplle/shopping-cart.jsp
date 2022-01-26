<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

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
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<jsp:include page="header.jsp" />

    <section class="breadcrumb-section set-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2 class="jaeil_category_title">장바구니</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                	<th class="shoping__cart__check">
                                		<input type="checkbox" checked="checked" id="allCheck">
                                	</th>
                                    <th class="shoping__product">상품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>총 금액</th>
                                   <th class="shoping__cart__item__close">
                                 	   <span id="allClear">선택 삭제</span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="tb_cart"></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                 <div class="col-lg-6">
                   
                </div> 
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>주문 내역</h5>
                        <ul class="cost"></ul>
                        <span id="cart_take" class="primary-btn">주문 결제하기</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <form id="cartform" action="" method="post">
    	<input type="text" hidden="hidden" name="no">
		<input type="text" hidden="hidden" name="id" value="${id}">
    </form>
    
<jsp:include page="footer.jsp" />

    <!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>

 <script type="text/javascript">
 	ajaxDate('/web/cartSelect.do', {"id":'${id}'},'json');
 	
	function ajaxDate(url, data, dataType){
	 	 $.ajax({
			url:url,
			data:data,
			dataType:dataType,
			success:function(v){
				ajaxCartList(v);
			},
			error:function(e){
				alert('error!!'+e);
			}
		});  
	 }
 	function ajaxCartList(v){
 		var temp="";
 		var costtemp="";
 		var itemtotal=0;
		$.each(v, function(index, dom){
	        temp+="<tr><td class=\"shoping__cart__check\">";
	        temp+="<input type=\"checkbox\" name=\"cart_no\" class=\"cart_checkbox_set\" checked=\"checked\" id=\""+dom.item_no+"\" value=\""+dom.cart_no+"\">";
	        temp+="</td><td class=\"shoping__cart__item\">";
	        temp+="<a href=\"shopInfo.do?no="+dom.item_no+"&job=iteminfo\">";
	        temp+="<img class=\"img-cartresponsive cart-img\" src=\""+dom.item_img+"\" alt=\"\">";
	        temp+="<h5>"+dom.item_name+"</h5></a></td>"
	        temp+="<td class=\"shoping__cart__price\">"+dom.item_price+" 원</td>";
	        temp+="<td class=\"shoping__cart__quantity\">";
	        temp+="<div class=\"quantity\">";
	        temp+="<div class=\"pro-qty\" id=\""+dom.cart_no+"\">";
	        temp+="<input type=\"text\" name=\""+dom.cart_no+"\"  value=\""+dom.cart_quan+"\">";
	        temp+="</div></div></td>";
	        temp+="<td class=\"shoping__cart__total\">";
	        temp+=dom.item_price*dom.cart_quan+" 원</td>";
	        temp+="<td class=\"shoping__cart__item__close\">";
	        temp+="<span class=\"icon_close\" id=\""+dom.cart_no+"\"></span></td></tr>";
	        itemtotal+=dom.item_price*dom.cart_quan;
		});
 		var total=3000+itemtotal;
		costtemp+="<li>주문 금액<span>"+itemtotal+"원</span></li>";
		costtemp+="<li>배송 금액<span>"+3000+"원</span></li>";
		costtemp+="<li>총 금액<span>"+total+"원</span></li>";
        
		$("#tb_cart").html(temp);
		$(".cost").html(costtemp);
        $.getScript('js/main.js');
 	}

 	// 상품 개수 업데이트
 	$(document).on("click",'.pro-qty',function(){ 
		var cart_no=$(this).attr("id");
		$("input[name="+cart_no+"]").val(parseInt($("input[name="+cart_no+"]").val()));
		var cart_quan = $("input[name="+cart_no+"]").val();

		ajaxDate('/web/quanUpdate.do', {"cart_no":cart_no, "cart_quan":cart_quan,"id":'${id}'}, 'json');
	});
 	
	$('#allCheck').click(function(){ /* 전체 체크 */
 		if($('input:checkbox#allCheck').prop("checked")){
 			$("input[type=checkbox]").prop("checked", true);
 		}else{
 			$("input[type=checkbox]").prop("checked", false);
 		}
 	});

 	
 	$('#allClear').click(function(){ /* 선택해서 삭제 */
 		var list = new Array();
 	
 		$("input[name=cart_no]").each(function(index, item){
 			if($(item).is(":checked") == true){
 				list.push($(item).val());
 			}
 		});
 		ajaxDate('/web/cartDelete.do', {"id":'${id}',"no":list},'json');
 	});

	$(document).on("click",'.icon_close',function(){/* 개별 삭제 버튼 눌렀을 때 삭제 */
		var list = new Array();
		list.push($(this).attr("id"));
		
		ajaxDate('/web/cartDelete.do', {"id":'${id}',"no":list},'json');
 	});
	
 	$("#cart_take").click(function(){
 		var cnt=$("input[name=cart_no]").length;
 		var list=new Array();
 		var str=null;
 		
 		if($('.cart_checkbox_set:checked').length< 1){
 		     alert('최소한 1개 이상 항목을 선택하셔야 합니다');
 		     return false;
 		}

 		$("input[name=cart_no]").each(function(index, item){
 			list.push($(item).attr('id'));
 			if($(item).is(":checked") == true){
	 			if(str==null){
	 				str=$(item).attr('id');
	 			}else{
	 				str+='#'+$(item).attr('id');
	 			}
		 		$("input[name=no]").val(str);
 			}
 			if(str!=null){
 				$("form#cartform").attr('action', "cartTake.do");
		 		$("#cartform").submit();
 			}
 		});
 	});


 	
</script>

</body>

</html>