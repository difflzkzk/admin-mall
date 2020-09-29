<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-light">
<ul class="navbar-nav">
	<li class="nav-item">
		<a href="/mall-admin/index.jsp" class="btn btn-dark" role="button" >처음으로</a>
	</li>
	<li class="nav-item">
		<a href="/mall-admin/category/categoryList.jsp" class="btn btn-dark" role="button">상품 카테고리 관리</a>
	</li>
	<li class="nav-item">
		<a href="/mall-admin/product/productList.jsp" class="btn btn-dark" role="button">상품관리</a>
	</li>	
	<li class="nav-item">
		<a href="/mall-admin/notice/noticeList.jsp" class="btn btn-dark" role="button">공지관리</a>
	</li>
	<li class="nav-item">
		<a href="/mall-admin/member/memberList.jsp" class="btn btn-dark" role="button">회원관리</a>
	</li>	
	<li class="nav-item">
		<a href="/mall-admin/logoutAction.jsp" class="btn btn-dark" role="button">로그아웃</a>
	</li>
</ul>
</nav>