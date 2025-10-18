<body bgcolor="pink" text="blue">
<form action='setattendance3.jsp'>
<center><h1>
<%
String s1=request.getParameter("t1");
session.setAttribute("branch",s1);
%>

	Select Date<input type="date" name="t1"><br><br>
	Presentees List<textarea name="t2" rows="3" cols="40"></textarea><br><br>

	Absentees List<textarea name="t3" rows="3" cols="40"></textarea><br><br>

<input type="submit" value="SUBMIT">
</form>
</body>
