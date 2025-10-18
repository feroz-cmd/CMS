<html>
<body bgcolor="pink" text="blue">
<form action='modifystaff2.jsp'>
<%@page import="java.sql.*"%>
<center>
<%
try
{
 String s1=request.getParameter("t1");
 Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","scott","tiger");
Statement st=con.createStatement();
String qry="select *From staff where stid='"+s1+"'";	
ResultSet rs=st.executeQuery(qry);
out.println("<table border=1");
if(rs.next())
{
out.println("<tr><th>staff Id</th><td><input type=text name=t1 value='"+s1+"' readonly>");

out.println("<tr><th>staff Name</th><td><input type=text name=t2 value='"+rs.getString(2)+"' >");

out.println("<tr><th>Email</th><td><input type=text name=t3 value='"+rs.getString(3)+"' >");

out.println("<tr><th>Phone Number</th><td><input type=text name=t3 value='"+rs.getString(4)+"' >");

out.println("<tr><th>DOB</th><td><input type=text name=t4 value='"+rs.getString(6)+"' >");
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
</table>
<input type='submit' value='UPDATE'>
</form>
<body>
</html>