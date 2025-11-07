<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title>Staff Registration Result</title>
</head>
<body bgcolor="pink" text="blue">
<center>

<%
try {
    // Retrieve session and form values
    String s1 = (String) session.getAttribute("sid"); // Staff ID
    String s2 = request.getParameter("t2"); // Name
    String s3 = request.getParameter("t3"); // Email
    String s4 = request.getParameter("t4"); // Phone
    String s5 = request.getParameter("t5"); // Photo filename
    String s6 = request.getParameter("t6"); // DOB (yyyy-MM-dd)
    String s7 = request.getParameter("t7"); // Gender
    String s8 = (String) session.getAttribute("date"); // Joining Date (yyyy-MM-dd)

    // Load PostgreSQL Driver
    Class.forName("org.postgresql.Driver");

    // Connect to Render PostgreSQL
    Connection con = DriverManager.getConnection(
        "jdbc:postgresql://dpg-d46uvfumcj7s73ddk8ug-a.singapore-postgres.render.com:5432/staffdb_vkwf",
        "staffdb_vkwf_user",
        "2jAtPgmq5jRb0IkOaMmdJE8IX89E90NO"
    );

    // Prepare SQL Insert Statement
    PreparedStatement pst = con.prepareStatement(
        "INSERT INTO staff (stid, name, email, phone, photo, dob, gender, joining_date, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
    );

    // Set parameters
    pst.setInt(1, Integer.parseInt(s1));
    pst.setString(2, s2);
    pst.setString(3, s3);
    pst.setString(4, s4);
    pst.setString(5, s5);

    // Convert DOB string (yyyy-MM-dd) to java.sql.Date
    java.sql.Date dobDate = java.sql.Date.valueOf(s6);
    pst.setDate(6, dobDate);

    pst.setString(7, s7);

    // Convert joining date string to java.sql.Date safely
    java.sql.Date joinDate;
    try {
        joinDate = java.sql.Date.valueOf(s8);
    } catch (Exception ex) {
        // fallback if session date was in dd-MM-yyyy format
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy");
        java.util.Date parsed = sdf.parse(s8);
        joinDate = new java.sql.Date(parsed.getTime());
    }
    pst.setDate(8, joinDate);

    pst.setString(9, "Active");

    int rows = pst.executeUpdate();

    if (rows > 0) {
        out.println("<h2 style='color:green;'>✅ Registered Successfully!</h2>");
        out.println("<h3>Staff ID: " + s1 + "</h3>");
        out.println("<h3>Name: " + s2 + "</h3>");
    } else {
        out.println("<h2 style='color:red;'>❌ Registration Failed.</h2>");
    }

    pst.close();
    con.close();

} catch (Exception e) {
    out.println("<h3 style='color:red;'>⚠ Error: " + e.getMessage() + "</h3>");
    // ✅ Correct way to print stack trace in JSP
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    e.printStackTrace(pw);
    out.println("<pre>" + sw.toString() + "</pre>");
}
%>

<br><br>
<a href="addstaff.jsp" style="font-size:18px; color:blue;">⬅ Back to Registration</a>
</center>
</body>
</html>
