<html>
<body bgcolor="pink" text="blue">
<form action="verify.jsp">
<center><h1>COLLEGE MANAGEMENT SYSTEM
<table border="1" style='position:absolute;top:100pt;left:500pt'>
	<tr>	<th>User Type</th>
		<td><select name="t1">
			<option>--SELECT--</option>
			<option>Admin</option>
			<option>Staff</option>
			<option>Student</option>
		   </select></td>
	</tr>
	<tr>
		<th> User Name</th>
		<td><input type="text" name="t2" required>
	</tr>
	<tr>
		<th> Password</th>
	     <td><input type="password" name="t3" required>
	</tr>
</table>
<input type="submit" value="LOGIN" style='position:absolute;top:160pt;left:560pt'>
</form>
</body>
</html>