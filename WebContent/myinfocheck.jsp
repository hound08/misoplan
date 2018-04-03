<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Controller" class="control.Controller"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name_check = request.getParameter("name_check");
	boolean flag = true;
	String str = "";
	if(name_check == null){
		name_check = "";
	}
	/* MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto();
boolean result = dao.nameChk(Nickname); */
	if(!name_check.equals("")){
		flag = Controller.name_result(name_check);
	} 
	if(flag){  // 이미 존재하는 닉네임
		str = "NO";
		out.println(str);
	}else{
		str = "YES";
		out.println(str);
	}

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>