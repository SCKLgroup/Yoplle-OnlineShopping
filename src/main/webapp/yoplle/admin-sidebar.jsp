<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
     <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin-user-management.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                   <i class="fas fa-laugh"></i>
                </div>
                 <div class="sidebar-brand-text mx-3">YOPLLE</div>
               <!--   <img src="img/logo.png" width="160px" height="80px" alt=""> -->
            </a>
            
            <li class="nav-item active">
                <a class="nav-link" href="mainPage.do">
           		<i class="fas fa-home"></i>
                    <span>요플레 바로가기</span></a>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                <i class="fas fa-chart-line"></i>
                    <span>통계</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

   			<div class="sidebar-heading">
               User
            </div>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-user-friends"></i>
                    <span>회원 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">회원 관리</h6>
                        <a class="collapse-item" href="admin-user-management.jsp">회원 관리</a>
                        <a class="collapse-item" href="#">회원 문의 관리</a>
                    </div>
                </div>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="#">
            <i class="fas fa-truck"></i>
                    <span>배송 관리</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="#">
            <i class="fas fa-undo-alt"></i>
                    <span>환불 관리</span></a>
            </li>
            

             <hr class="sidebar-divider d-none d-md-block">
              
             <div class="sidebar-heading">
                Product
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                   <i class="fas fa-weight-hanging"></i>
                    <span>상품 관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">상품 관리</h6>
                        <a class="collapse-item" href="admin-item-management.jsp">상품 관리</a>
                        <a class="collapse-item" href="admin-product-write.jsp">상품 등록</a>
                    </div>
                </div>
            </li>
            
            <hr class="sidebar-divider d-none d-md-block">
            
            <div class="sidebar-heading">
             	Notice
            </div>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                  <i class="fas fa-edit"></i>
                    <span>공지 사항</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">공지사항</h6>
                        <a class="collapse-item" href="list.do">공지사항 관리</a>
                        <a class="collapse-item" href="admin-notice-write.jsp">공지사항 작성</a>
                        <h6 class="collapse-header">이벤트</h6>
                        <a class="collapse-item" href="#">이벤트 관리</a>
                        <a class="collapse-item" href="#">이벤트 작성</a>
                    </div>
                </div>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>

</body>
</html>