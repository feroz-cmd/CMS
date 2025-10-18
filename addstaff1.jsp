<html>
<body bgcolor="pink" text="blue">
<%@page import="java.sql.*"%>
<%
try
{
	String s1=(String)session.getAttribute("sid");

	String s2=request.getParameter("t2");
	String s3=request.getParameter("t3");
	String s4=request.getParameter("t4");
	String s5=request.getParameter("t5");
	String s6=request.getParameter("t6");
	String s7=request.getParameter("t7");
String s8=(String)session.getAttribute("date");

   Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","scott","tiger");
PreparedStatement pst=con.prepareStatement("insert into staff values(?,?,?,?,?,?,?,?,?)");

	pst.setString(1,s1);
	pst.setString(2,s2);
	pst.setString(3,s3);
	pst.setString(4,s4);
	pst.setString(5,s5);
	pst.setString(6,s6);
	pst.setString(7,s7);
	pst.setString(8,s8);
	pst.setString(9,"Active");
	
	pst.executeUpdate();
	out.println("Registed successfully");
	pst.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}	
%>