<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") != null) {
		System.out.println("이미 로그인 되어 있는 상태입니다.");
		response.sendRedirect("/mall-admin/index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>관리자 로그인</h1>
	<form method="post" action="/mall-admin/loginAction.jsp"> 
		<table border="1">
			<tr>
				<td>관리자 ID</td>
				<td><input type="text" name="adminId"></td>
			</tr>
			<tr>
				<td>관리자 PW</td>
				<td><input type="password" name="adminPw"></td>
			</tr>
		</table>
		<button type="submit">로그인</button>
	</form>
</body>
</html>