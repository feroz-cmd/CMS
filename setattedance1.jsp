<body bgcolor="pink" text="blue">
<%
String s1=request.getParameter("t1");
session.setAttribute("year",s1);
%>
<center><h1>
	<a href='setattedance2.jsp?t1=ECE-A'>ECE-A</a><br><br>
	<a href='setattedance2.jsp?t1=ECE-B'>ECE-B</a><br><br>
	<a href='setattedance2.jsp?t1=ECE-C'>ECE-C</a><br><br>
	<a href='setattedance2.jsp?t1=ECE-D'>ECE-D</a>
	</center>
</body>