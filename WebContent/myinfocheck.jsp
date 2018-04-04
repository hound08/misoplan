<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*" errorPage="Error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% 	String Nickname = request.getParameter("Nickname"); %>
<script type="text/javascript">
	function wincl() {
		opener.document.frm.Nickname.value="<%=Nickname%>";
		window.close();
	}
</script></head><body>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.nameChk(Nickname);
	if (result == 0) {
%>
	<%=Nickname %>는 사용할수 있습니다<p>
	<input type="button" value="닫기" onclick="wincl()">		
<%	} else { %>
	<%=Nickname %>이미 있는 아이디니 다른 것을 입력하세요<p>
	<form>
		아이디 : <input type="text" name="Nickname"><p>
		<input type="submit" value="확인">
	</form>
<% } %>
</body>
</html>