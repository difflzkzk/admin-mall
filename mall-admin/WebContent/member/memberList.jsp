<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
	<h1 class="bg-secondary text-white">회원관리 페이지</h1>
	<%
	request.setCharacterEncoding("utf-8");
	MemberDao memberDao = new MemberDao();
	ArrayList<Member>list = memberDao.selectMemberList();
	%>
	
	<table class="table table-light table-striped table-hover">
		<thead>
			<tr>
				<th>이메일</th>
				<th>비번</th>
				<th>이름</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Member m : list) {
		%>
			<tr>
				<td><%=m.memberEmail %></td>
				<td><%=m.memberPw %></td>
				<td><%=m.memberName %></td>
				<td><%=m.memberDate %></td>
				<td><a href="/mall-admin/member/memberListDelete.jsp?memberEmail=<%=m.memberEmail%>">삭제</a></td>
			</tr>
		<%
			}
		%>	
		</tbody>
		
	</table>
	</div>
</body>
</html>