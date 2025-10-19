<html>
<body bgcolor="pink" text="blue">
<%@page import="java.sql.*"%>
<center><h1>
<%
try
{
	String utype=request.getParameter("t1");
	String uname=request.getParameter("t2");
	String pwd=request.getParameter("t3");

	//Class.forName("oracle.jdbc.driver.OracleDriver");
//Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","scott","tiger");
//Statement st=con.createStatement();

if(utype.equals("Admin"))
{
	if(uname.equals("Admin") && pwd.equals("Admin"))
	{
		response.sendRedirect("AdminPage.jsp");
	}
	else
	{
		out.println("Invalid UserName/password");
		out.println("<br><a href=index.jsp>Click Here</a> to back");	
	}
}
/*else if(utype.equals("Staff"))
{
String qry="select *from staff where stid='"+uname+"' and stid='"+pwd+"' and status='Active'";
	ResultSet rs=st.executeQuery(qry);

	if(rs.next())
	{
		session.setAttribute("stid",rs.getString(1));
		session.setAttribute("stname",rs.getString(2));
		response.sendRedirect("StaffPage.jsp");
	}	
	else
	{
		out.println("Invalid UserName/password");
out.println("<br><a href=index.jsp>Click Here</a> to back");	
	}	
}*/
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>





