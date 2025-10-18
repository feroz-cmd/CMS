<html>
<body bgcolor="pink" text="blue">
<form action='modifystaff1.jsp'>
<%@page import="java.sql.*"%>
<center><h1>STAFF UPDATE FORM
<br>
Select Staff Id<select name="t1">
		<option>---SELECT----</option>
<%
	try
	{
 Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","scott","tiger");
Statement st=con.createStatement();
String qry="select stid from staff where status='Active'";
ResultSet rs=st.executeQuery(qry);	
	while(rs.next())
	{
	out.println("<option>"+rs.getString(1)+"</option>");
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
</select>
<input type="submit" value="SHOW">
</form>
</body>
</html> 
