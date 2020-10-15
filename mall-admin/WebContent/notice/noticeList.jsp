<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeListAll</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
<h1 class="bg-secondary text-white">공지사항 관리</h1>
<%
		request.setCharacterEncoding("utf-8");
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice>list = noticeDao.selectNoticeList();
%>
	<table class="table">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
				<th>notice_content</th>
				<th>notice_date</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Notice n : list) {
		%>
			<tr>
				<td><%=n.noticeId %></td>
				<td><a href= "<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=n.noticeId %>" ><%=n.noticeTitle %></a></td>
				<td><%=n.noticeContent %></td>
				<td><%=n.noticeDate %></td>
				<td>삭제</td>
			</tr>
		<%
			}
		%>	
		</tbody>
		<tr>
		<td><a href="/mall-admin/notice/noticeListAction.jsp" class="btn btn-info text-white" role="button">공지 작성</a></td>
		</tr>
	</table>

<div>

</div>
</div>

</body>
</html>