<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	//세션안에 로그인이 null이면 로그인을 실행하지 않는다.
	if(session.getAttribute("loginAdminId") == null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<style>
		div { text-align: center; }
.jumbotron.jumbotron-blue {
     background: #FFC107;
     color: white;
     padding: 70px 30px;
     margin: 0;
}
	</style>
</head>
<body class="container">
<div>
	<div>
		<jsp:include page="/inc/menu.jsp" ></jsp:include>
	</div>
	
	<div class="jumbotron jumbotron-dark"  align="center" >
  		<h1>쇼핑몰 관리자 메인 페이지</h1>
  		<p><%=session.getAttribute("loginAdminId")%>님 반갑습니다.</p>
	</div>
	
	<div>
		<img src="./image/category.jpg" align="center" class="img-thumbnail" >
	</div>
	
	<table border="1" align="center">
	<th>
	본 프로젝트는 강사님과 수업을 진행하는중 일주일 정도의 기간으로 만든 쇼핑몰 관리자 프로젝트입니다.</p>
	본 프로젝트에는 쇼핑몰 카테고리 관리와 상품관리로 구성되어 있습니다.</p>
	각각의 프로젝트에는 카테고리 정보의 등록 및 수정 삭제가 구현되어 있습니다.</p>
	개발 환경은 java 8버전을 사용하였으며 tomcat 8.5버전으로 진행하였고  이클립스 통합 개발 환경을 사용하였습니다.</p>
	데이터 베이스는 mariaDB 10.3 버전을 사용하였으며 HeidiSQL 툴을 이용하였습니다.</p>
	두개의 패키지가 존재하며 dao 패키지에는 jsp에서 db를 연동시키는 식과 페이지에서 요청하는 sql문을 내려줄수있는 쿼리가 작성되어 있습니다.</p>
	vo패키지에는 DB테이블의 필드명이 명시되어 있습니다.</p>
	
	</th>
	</table>
</div>
</body>
</html>