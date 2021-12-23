<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CodePen - Recipe Card</title>
<link rel="stylesheet" href="css/recipe-detail-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css"
	integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug=="
	crossorigin="anonymous" />
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
<link rel="stylesheet" href="css/slidestyle.css">
<link rel="stylesheet" href="css/replystyle.css">
</head>
<body>
	<c:set var="img" value="${recipeInfoList.rpe_img}" />
	<c:set var="imglist" value="${functions:split(img,'/')}" />
	<jsp:include page="header.jsp" />

	
	<div id="recipe-card-container">
		<div id="card-part">
			<div id="card-title">${recipeInfoList.rpe_title}</div>
			<div class="card-inform">
				<span> 작성자 <span class="card-inform-data"> ${recipeInfoList.user_id} </span></span> 
				<span class="hit"> 조회수 <span class="card-inform-data">${recipeInfoList.rpe_hit} </span></span>
			</div>
			
			<c:catch>
				<c:choose>
					<c:when test="${recipeInfoList.user_id eq id}">
						<div style="text-align: right; padding: 10px">
							<span style="padding-right: 20px">
								<a href="modifyRecipe.do?no=${recipeInfoList.rpe_no}" id="recipe_modify" style="font-size: 15px">수정</a></span> 
							<span>
								<a href="deleteRecipe.do?no=${recipeInfoList.rpe_no}" id="recipe_delete" style="font-size: 15px">삭제</a></span>
						</div>
					</c:when>
				</c:choose>
			</c:catch>
			
			<c:catch>
				<c:choose>
					<c:when test="${imglist[2] ne null }">
						<div>
							<img class="recipe-main-image mainimg" src="${recipeInfoList.rpe_img}">
						</div>
					</c:when>
					<c:otherwise>
						<div>
							<img class="recipe-main-image mainimg" src="img/recipe/${recipeInfoList.rpe_img}">
						</div>
					</c:otherwise>
				</c:choose>
			</c:catch>
			
			<!-- 해시태그  -->
			<div class="contents">${recipeInfoList.rpe_content}</div>
				<div class="hashtag">
					<c:forEach var="i" items="${recipeHashList}" varStatus="cnt">
						# ${i.RPE_HASH_TAG}
					</c:forEach>
				</div>
			</div>

			<div id="card-part">
				<ul class="recipe-list meta">
					<li class="recipe-item">
						<div class="recipe-value"><i class="far fa-user fa-2x"></i></div>
						<div class="recipe-text">${recipeInfoList.rpe_quan}</div>
					</li>
					<li class="recipe-item">
						<div class="recipe-value"><i class="far fa-clock fa-2x"></i></div>
						<div class="recipe-text">${recipeInfoList.rpe_time}분</div>
					</li>
					<li class="recipe-item">
						<div class="recipe-value"><i class="far fa-star fa-2x"></i></div>
						<div class="recipe-text">${recipeInfoList.rpe_diff}</div>
					</li>
				</ul>
				
				<div id="card-items">
					<div class="ingredient">
						<span class="card-item-title"> 재료 </span> 
						<span class="card-item-title-second"> Ingredients </span>
						<ul class="checkmark">
							<c:forEach var="i" items="${recipeIngrList}" varStatus="cnt">
								<li>${i.INGR_NAME}${i.INGR_QUAN }</li>
							</c:forEach>
						</ul>
					</div>

					<div id="method">
						<span class="card-item-title">요리 순서</span> 
						<span class="card-item-title-second">Recipe</span>
						<div id="recipe">
							<c:forEach var="i" items="${recipeDeList}" varStatus="cnt">
								<div id="recipe-num">
									<div id="recipe-step">${i.RPE_DE_CONTENT}
										<c:catch>
											<c:choose>
												<c:when test="${i.RPE_DE_IMG ne null}">
													<c:choose>
														<c:when test="${imglist[2] ne null }">
															<div id="recipe-img">
																<img id="repimg" src="${i.RPE_DE_IMG}">
															</div>
														</c:when>
														<c:otherwise>
															<div id="recipe-img">
																<img id="repimg" src="img/recipe/${i.RPE_DE_IMG}">
															</div>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<div id="recipe-img"></div>
												</c:otherwise>
											</c:choose>
										</c:catch>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			
			<c:if test="${not empty recipeItemList}">
				<div id="card-part">
					<span class="card-item-title">재료 사러가기</span> 
					<span class="card-item-title-second">Shopping</span>
					<div class="row shop">
						<div class="col-md-12">
							<div class="carousel carousel-showmanymoveone slide" id="carouselABC">
								<div class="carousel-inner">
									<c:forEach var="i" items="${recipeItemList}" varStatus="cnt">
										<c:choose>
											<c:when test="${cnt.index == 0}">
												<div class="item active">
													<div class="col-xs-12 col-sm-6 col-md-3" onclick="location.href='shopInfo.do?no=${i.item_no}&job=iteminfo'">
														<img src="${i.item_img}" class="img-responsive item-img">
														<div class="item-name">${i.item_name}</div>
														<div class="item-price">${i.item_price}&nbsp;원</div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="item">
													<div class="col-xs-12 col-sm-6 col-md-3" onclick="location.href='shopInfo.do?no=${i.item_no}&job=iteminfo'">
														<img src="${i.item_img}" class="img-responsive item-img">
														<div class="item-name">${i.item_name}</div>
														<div class="item-price">${i.item_price}&nbsp;원</div>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
								<a class="left carousel-control" href="#carouselABC" data-slide="prev" id="slide-left-btn">
									<i class="glyphicon glyphicon-chevron-left"></i></a> 
								<a	class="right carousel-control" href="#carouselABC" data-slide="next" id="slide-right-btn">
									<i class="glyphicon glyphicon-chevron-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</c:if>

			<div class="comments">
				<span class="like" id="like"> 
					<span class="num" id="likenum">${recipeInfoList.rpe_like }</span>
					<span class="card-item-title like"> 
						<input type="text" name="no" id="no" hidden="hidden" value="${no}">
						 <c:choose>
							<c:when test="${likeCheck eq null}">
								<i class="far fa-heart fa-lg"></i>
							</c:when>
							<c:otherwise>
								<i class="fas fa-heart fa-lg" style="color: #FA5882"></i>
							</c:otherwise>
						</c:choose>
					</span>
				</span>
				<div class="reply-list">
					<div class="comment-wrap write">
						<div class="comment-block write">
							<c:choose>
								<c:when test="${no eq null}">
									<textarea class="replycontents" name="com_content" id="replyArea" cols="30" rows="3" placeholder="로그인이 필요합니다" disabled></textarea>
								</c:when>
								<c:otherwise>
									<form action="#" id="replyForm" name="replyForm" method="post">
										<input type="hidden" name="rpe_no" value="${recipeInfoList.rpe_no}">
										<input type="hidden" name="user_no" value="${no}">
										<input type="hidden" name="user_id" value="${id}">
										<input type="hidden" name="com_job" value="new">
										<textarea class="replycontents" name="com_content" id="replyArea" cols="30" rows="3" placeholder="댓글을 작성해주세요"></textarea>
										<button type="button" id="replybtn" class="btn-css">확인</button>
									</form>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div id="replyShow"></div> 
				</div>
			</div>
		</div>

	<jsp:include page="footer.jsp" />

	<!-- partial -->

	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
	<script src="js/slidescript.js"></script>

<script type="text/javascript">
	replyAjax('/web/recipeReplyList.do',{"rpe_no":${recipeInfoList.rpe_no}},'json');

	var no=$("input#no").val();
	$("span#like").click(function(){
		if($("input#no").val()==""){
			alert('로그인이 필요합니다');
			return false;
		}else{
			var temp="";
			$.ajax({
		          url:'/web/recipeLike.do',
		          type:'post',
		          data: { "userno":no,
		        	  	 "rpeno":${recipeInfoList.rpe_no}},
		          dataType:'json',              
		          success:function(v){
		        	  temp+= "<span class=\"num\" id=\"likenum\">"+v.recipeInfo.rpe_like+"</span>";
		        	  if(v.check==0){
		        		  temp+= "<span class=\"card-item-title like\"> <i class=\"fas fa-heart fa-lg\" style=\"color: #FA5882\"></i> </span>";
		        	  }else{
		        		  temp+= "<span class=\"card-item-title like\"> <i class=\"far fa-heart fa-lg\"></i> </span>";
		        	  }
					$("span#like").html(temp);
		          },
		          error:function(e){
		             alert('error'+e);
		          }
		     }); 
		}
	});	
	
	$("a#recipe_modify").click(function() {
	      if (confirm("글을 수정하시겠습니까?") == true) { //확인
	         $("img-").off("click").on('click', function() {
	         });
	      } else { //취소
	         return false;
	      }
	   });

	   $("a#recipe_delete").click(function() {
	      if (confirm("글을 삭제하시겠습니까?") == true) { //확인
	         $("img-").off("click").on('click', function() {
	         });
	      } else { //취소
	         return false;
	      }
	   });
	   
   // 댓글 작성 
   $(function(){
 		$("button#replybtn").click(function(){
 			replyAjax('${pageContext.request.contextPath}/recipeReply.do',$("form#replyForm").serialize(),'json');
 	    });
 	});
   
   function replyAjax(url,data,dataType){
	     $.ajax({
	          url:url,
	          type:'POST',
	          data:data,
	          dataType:dataType,              
	          success:function(v){
	             ajaxReplyList(v);
	          },
	          error:function(e){
	             alert('error'+e);
	          }
	       });   
	  }
  
   function ajaxReplyList(v){
      var temp="";
    	   	temp+="<div class=\"replyStart\"> <span class=\"card-item-title write\">댓글</span> <span class=\"num\">"+v.count+"</span></div>";
       $.each(v.replyList,function(index,dom){
			temp+="<div class=\"comment-wrap\">";
			temp+="<div class=\"comment-block\">";
			temp+="<p class=\"comment-text\">"+dom.com_content+"</p>";
			temp+="<div class=\"bottom-comment\">";
			temp+="<div class=\"comment-writer\"><strong>작성자 "+dom.user_id+"</strong></div>";
			temp+="<div class=\"comment-date\">"+dom.com_date+"</div>";
			temp+="<ul class=\"comment-actions\">";
			if(no==dom.user_no){
				temp+="<span id=\"replyDelete\"><a href='javascript:replyDel("+dom.com_no+")'>삭제</a></span>";
			}
			temp+="</ul></div></div></div>";
       });
       $("div#replyShow").html(temp);
       $("textarea#replyArea").val('');
   }
   
   // 댓글 삭제
   function replyDel(replyno){
	   if (confirm("댓글을 삭제하시겠습니까?") == true) { //확인
	    	  replyAjax('/web/deleteRecipeReply.do',
	    			 { "no":replyno, "rpe_no":${recipeInfoList.rpe_no}}, 'json');
	  	} else { //취소
	         return false;
	   	}
   }


</script>


</body>
</html>
