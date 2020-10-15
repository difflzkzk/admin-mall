<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>notice</title>
</head>
<body>
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
	
	<%
		int noticeId = Integer.parseInt(request.getParameter("noticeId"));
		System.out.println(noticeId+ "<--noticeId");
		NoticeDao noticeDao = new NoticeDao();
	  	Notice notice = noticeDao.selectNoticeOne(noticeId);
	%>
		<h1 class="bg-secondary text-white">공지사항 상세보기</h1>
		<table class="table table-borderd">
			<tr>
				<td>공지 아이디</td>
				<td><%=notice.noticeId %></td>
			</tr>
			<tr>
				<td>공지 제목</td>
				<td><%=notice.noticeTitle %></td>
			</tr>
			<tr>	
				<td>공지 내용</td>
				<td><%=notice.noticeContent %></td>
			</tr>
			<tr>
				<td>공지 날짜</td>
				<td><%=notice.noticeDate %></td>
			</tr>
			<tr>
				<td></td>
				<td><a href ="">수정</a></td>
			</tr>			
			<tr>
				<td><a href ="<%=request.getContextPath()%>/index.jsp">홈으로</a></td>
				<td><a href ="<%=request.getContextPath()%>/notice/noticeList.jsp">공지사항 보기</a></td>
			</tr>
			
		</table>
	
	</div>
</body>
</html>