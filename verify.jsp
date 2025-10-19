
<html>
<body bgcolor="pink" text="blue">
<center>
<h1>
<%
try {
    String utype = request.getParameter("t1");
    String uname = request.getParameter("t2");
    String pwd   = request.getParameter("t3");

    // 🔹 Temporarily disabling all database-related logic to avoid ClassNotFoundException
    // 🔹 No Oracle driver or connection will be attempted here.

    if ("Admin".equalsIgnoreCase(utype)) {
        if ("Admin".equals(uname) && "Admin".equals(pwd)) {
            response.sendRedirect("AdminPage.jsp");
        } else {
            out.println("Invalid Username/Password");
            out.println("<br><a href='index.jsp'>Click Here</a> to go back");
        }
    } else {
        out.println("Invalid User Type");
        out.println("<br><a href='index.jsp'>Click Here</a> to go back");
    }

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
</h1>
</center>
</body>
</html>
