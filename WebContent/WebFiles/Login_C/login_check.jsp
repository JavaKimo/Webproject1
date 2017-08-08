<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	//定义驱动程序
	public static final String DBDRIVER="org.gjt.mm.mysql.Driver";
	public static final String DBURL="jdbc:mysql://localhost:3306/wu?characterEncoding=utf8&useSSL=false";
	public static final String DBUSER="root";
	public static final String DBPASS="wutianyun1234";
	
%>
<% 
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	boolean flag=false;   								//定义标志位
	String name=null;									//接受用户的真实姓名

%>
<%
	try{
		Class.forName(DBDRIVER);
		conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
		//System.out.println(conn);
		String sql="select name from user where userid=? and password=? ";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,request.getParameter("id"));
		pstmt.setString(2,request.getParameter("password"));
		rs=pstmt.executeQuery();
		if(rs.next()){
			name=rs.getString(1);
			flag=true;
		}
	}catch(Exception e){
		System.out.print(e);
	}finally{
		try{
			rs.close();
			pstmt.close();
			conn.close();			
		}catch(Exception e){}		
	}
%>
<%
	if(flag){
%>
	<jsp:forward page="login_success.jsp">
		<jsp:param name="uname" value="<%=name %>"/>
	</jsp:forward>
<%
	}else{
		
%>
	<jsp:forward page="login_failure.html"></jsp:forward>
<% }%>

</body>
</html>