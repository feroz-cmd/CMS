<html>
<body bgcolor="pink" text="blue">
<%@page import="java.sql.*"%>
<center><h1>
<table border="1" width="700">
<tr>
	<th> staff Id</th>
	<th> staff Name</th>
	<th> Email</th>
	<th> Phone No</th>
	<th> Photo</th>
	<th> DOB</th>
	<th> Gender</th>
	<th> Joining Date</th>	
</tr>
<%
try
{
 Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","scott","tiger");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select *from staff where status='Active'");

	while(rs.next())
	{
	String sid=rs.getString(1);
	String x=rs.getString(5);
	//out.println(x);
//out.println(application.getRealPath(x));
out.println("<tr><td>"+sid+"</td>");
out.println("<td>"+rs.getString(2)+"</td>");
out.println("<td>"+rs.getString(3)+"</td>");
out.println("<td>"+rs.getString(4)+"</td>");
out.println("<td><img src='"+x+"' width='100' height='100'></td>");
out.println("<td>"+rs.getString(6)+"</td>");
out.println("<td>"+rs.getString(7)+"</td>");
out.println("<td>"+rs.getString(8)+"</td>");
out.println("<td><a href='deletestaff1.jsp?t1="+sid+"'>delete</a></td>");
out.println("</tr>");
	}
	rs.close();
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
