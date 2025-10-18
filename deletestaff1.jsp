<html>
<body bgcolor="pink" text="blue">
<center><h1>
<%@page import="java.sql.*"%>
<%
	String s1=request.getParameter("t1");
	//out.println(s1);
try
{
 Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","scott","tiger");
Statement st=con.createStatement();
String qry="update staff set status='Deactive' where stid='"+s1+"'";
	st.executeUpdate(qry);
out.println(s1+" Deleted successfully");
	st.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>