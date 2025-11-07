<html>
<body bgcolor="pink" text="blue">
<form action="addstaff1.jsp" method="get">
<center><h1>Staff Registration
<%@page import="java.sql.*"%>
<%
int no=0;
try
{
 Class.forName("oracle.jdbc.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","scott","tiger");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select max(stid) from staff");

	if(rs.next())
	{
		no=Integer.parseInt(rs.getString(1))+1;
	}
}
catch(Exception e)
{
	no=10001;
}
	session.setAttribute("sid",String.valueOf(no));
%>
<table border="1">
<tr>
	<th>Staff Id</th>
  <td><input type=text name="t1" value=<%=no%> disabled></td>
</tr>
<tr>
	<th> Staff Name</th>
	<td> <input type="text" name="t2" ></td>
</tr>
<tr>
	<th> Email</th>
	<td> <input type="email" name="t3" ></td>
</tr>
<tr>
	<th> Phno</th>
	<td> <input type="phone" name="t4" ></td>
</tr>
<tr>
	<th> Photo</th>
	<td> <input type="file" name="t5" ></td>
</tr>
<tr>
	<th> DOB</th>
	<td> <input type="date" name="t6" ></td>
</tr>
<tr>
	<th> Gender</th>
	<td> <select name="t7">
	        <option>Male</option>
		<option>FeMale</option>
		<option>Others</option>
	</select></td>
</tr>
<tr>   <th> Joining Date</th>
	<%
java.text.SimpleDateFormat sd=new java.text.SimpleDateFormat("dd-MM-yyyy");
	String str=sd.format(new java.util.Date()).toString();	
	session.setAttribute("date",str);  //session variable
	%>
       <td> <input type="text" name="t8" value=<%=str%> disabled></td>
</table>
<input type="submit" value="REGISTER" style='position:absolute;top:200pt;left:200pt'>
</form>
</body>
</html>

