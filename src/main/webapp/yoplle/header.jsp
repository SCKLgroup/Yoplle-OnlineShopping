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
   crossoraigin="anonymous">
<!-- Css Styles -->

<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css"
   integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug=="
   crossorigin="anonymous" />

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

   <header class="header">
      <div class="header__top" style="background-color: #fff;">
         <div class="container" style="text-align: right;">
            <div class="row" style="text-align: right;">
               <div class="">
                  <div class="header__top__right" style="text-align: right;">
                     <div class="header__top__right__auth">
                        <div>
                           <c:catch>
                              <c:choose>
                                 <c:when test="${id eq null}">
                                    <a href="login.jsp" style="width: 90px; padding: 5px"> 로그인 </a>
                                    <a href="signup.jsp" style="width: 90px; padding: 5px"> 회원가입 </a>
                                    <a href="list2.do" style="width: 90px; padding: 5px"> 고객센터 </a>
                                 </c:when>

                                 <c:when test="${id eq 'admin'}">
                                    <a style="width: 90px; padding: 5px"> ${id }는 관리자계정입니다. </a>
                                    <a href="adminPage.do">관리자페이지 이동</a>
                                    <a href="logout.do" style="width: 90px; padding: 5px"> 로그아웃 </a>

                                 </c:when>
                                 <c:otherwise>
                                    <form id="mypage" method="post" action="mypage.do">
                                       <a style="width: 90px; padding: 5px"> ${id }님 반갑습니다 </a>
                                       <a href="logout.do" style="width: 90px; padding: 5px"> 로그아웃 </a>
                                       <a href="#" style="width: 90px; padding: 5px" onclick="mypage()" id="mypage">
                                          <input type="text" value="${id}" hidden="hidden" name="id">
                                          	마이페이지
                                       </a>
                                       <a href="list2.do" style="width: 90px; padding: 5px"> 고객센터 </a>
                                    </form>
                                 </c:otherwise>
                              </c:choose>
                           </c:catch>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <div class="container">
         <div class="row">
            <div class="col-lg-3">
               <div class="header__logo" style="text-align: center;">
                  <form name="loginFrm" method="post" action="login.do">
                     <!-- <input type="hidden" value="sist201" id="id" name="id">
                     <input type="hidden" value="1234" id="password" name="password"> -->
                     <a href="/web/yoplle/mainPage.do" id="mainlogo">
                        <img src="img/banner/logo.png" width="250px" height="120" alt="">
                     </a>
                  </form>
               </div>
            </div>
            <div class="woojin">
               <!-- col-lg-6-->
               <nav class="header__menu" style="width: 960px; padding: 30px 0px 30px 0px;">
                  <ul>
                     <li class="active"><a href="#">
                           <i class="fa fa-bars"></i>
                           &nbsp;카테고리
                        </a>
                        <ul class="header__menu__dropdown">
                           <li><a href="itemList.do?category=meat&page=1&sort=lastest">육류 및 계란</a></li>
                           <li><a href="itemList.do?category=vegetable&page=1&sort=lastest">채소</a></li>
                           <li><a href="itemList.do?category=fruit&page=1&sort=lastest">과일</a></li>
                           <li><a href="itemList.do?category=frozen&page=1&sort=lastest">냉동식품</a></li>
                           <li><a href="itemList.do?category=sauce&page=1&sort=lastest">소스류</a></li>
                        </ul></li>

                     <li><a href="productBest.do">베스트</a>
                        <ul class="header__menu__dropdown">
                           <li><a href="productBest.do">베스트 상품</a></li>
                           <!-- 수정 -->
                           <li><a href="recipeBest.do">베스트 레시피</a></li>

                        </ul></li>
                     <li><a href="recipeList.do?page=1&sort=lastest">레시피</a>
                        <ul class="header__menu__dropdown">
                           <li><a href="recipeList.do?page=1&sort=lastest">레시피 게시판</a></li>
                           <c:catch>
                              <c:choose>
                                 <c:when test="${id eq null}">
                                    <li><a onclick="recipe()" href="recipelogin.do"> 레시피 작성 </a></li>
                                 </c:when>
                                 <c:otherwise>
                                    <li><a href="recipeMake.jsp">레시피 작성</a></li>
                                 </c:otherwise>
                              </c:choose>
                           </c:catch>
                        </ul></li>

                     <li><a href="event.jsp">이벤트</a>
                     <li><a>
                           <form action="searchProduct.do">
                              <input class="search-area" type="text" placeholder="검색어를 입력하세요" name="search">
                              <button type="submit" class="search-icon">
                                 <i class="fas fa-search fa-lg"></i>
                              </button>
                           </form>
                        </a></li>

                     <li>
                        <div class="header__cart" style="">
                           <ul>
                              <li><a href="wishlist.jsp">
                                    <i class="fas fa-heart fa-2x"></i>
                                 </a></li>
                              <c:catch>
                                 <c:choose>
                                    <c:when test="${id != null }">
                                       <li><a href="shopping-cart.jsp">
                                             <i class="fa fa-shopping-bag fa-2x"></i>
                                          </a></li>
                                    </c:when>
                                    <c:otherwise>
                                       <li><a id="notice" href="login.jsp">
                                             <i class="fa fa-shopping-bag fa-2x"></i>
                                          </a></li>
                                    </c:otherwise>
                                 </c:choose>
                              </c:catch>
                           </ul>
                        </div>
                     </li>

                  </ul>
               </nav>

            </div>

         </div>
         <div class="humberger__open">
            <i class="fa fa-bars"></i>
         </div>

      </div>
   </header>
</body>

<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
   crossorigin="anonymous"></script>

<script type="text/javascript">
   function recipe() {
      if (confirm("로그인이 필요한 페이지입니다. 로그인 하시겠습니까?") == true) {
      } else {
         return;
      }
   }
   function mypage() {
      $("form#mypage").submit();
   }
</script>


</html>