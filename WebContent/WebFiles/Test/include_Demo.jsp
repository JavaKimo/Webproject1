<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String username="wutianyun"; %>
	<h1>动态包含传递参数</h1>
	<jsp:include page="receive_param.jsp">
	<jsp:param name ="name" value="<%=username %>"/>
	<jsp:param name="info" value="www.baidu.com"/>
	</jsp:include>
</body>
</html>