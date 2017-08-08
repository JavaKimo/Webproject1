<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

%>
<%
	try{
		Class.forName(DBDRIVER);
		conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);
		//System.out.println(conn);
		String sql="select Sid,name,sex,age from student ";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
%>

	<center>
	<table border="1" width="80%">
		<tr>
			<td>Sid</td>
			<td>name</td>
			<td>sex</td>
			<td>age</td>
		</tr>
<%
	while(rs.next()){
		String Sid=rs.getString(1);
		String name=rs.getString(2);
		String sex=rs.getString(3);
		int age=rs.getInt(4);
%>
	<tr>
		<td><%=Sid %></td>
		<td><%=name %></td>
		<td><%=sex %></td>
		<td><%=age %></td>	
	</tr>
<%
	}
%>
<%
	}catch(Exception e){
		System.out.print(e);
	}finally{
		rs.close();
		pstmt.close();
		conn.close();
	}


%>

</body>
</html>