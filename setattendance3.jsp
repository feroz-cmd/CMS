<html>
<body bgcolor="pink" text="blue">
<%@page import="java.sql.*"%>
<center><h1>
<%
try
{	String year=(String)session.getAttribute("year");
	String branch=(String)session.getAttribute("branch");
	String s1=request.getParameter("t1");
	String s2=request.getParameter("t2");
	String s3=request.getParameter("t3");

	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","scott","tiger");
PreparedStatement pst=con.prepareStatement("insert into attendance values(?,?,?,?,?)");

	pst.setString(1,year);
	pst.setString(2,branch);
	pst.setString(3,s1);
	pst.setString(4,s2);
	pst.setString(5,s3);

	pst.executeUpdate();
	out.println("Completed successfully");
	pst.close();
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>





