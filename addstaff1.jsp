<%@ page import="java.sql.*" %>
<html>
<body bgcolor="pink" text="blue">

<%
try {
    // Retrieve session values
    String s1 = (String) session.getAttribute("sid");
    String s2 = request.getParameter("t2"); // Staff Name
    String s3 = request.getParameter("t3"); // Email
    String s4 = request.getParameter("t4"); // Phone
    String s5 = request.getParameter("t5"); // Photo filename (optional)
    String s6 = request.getParameter("t6"); // DOB
    String s7 = request.getParameter("t7"); // Gender
    String s8 = (String) session.getAttribute("date"); // Joining Date

    // Load PostgreSQL driver
    Class.forName("org.postgresql.Driver");

    // Connect to Render PostgreSQL
    Connection con = DriverManager.getConnection(
        "jdbc:postgresql://dpg-d46uvfumcj7s73ddk8ug-a:5432/staffdb_vkwf",
        "staffdb_vkwf_user",
        "2jAtPgmq5jRb0IkOaMmdJE8IX89E90NO"
    );

    // Prepare insert query (PostgreSQL syntax)
    PreparedStatement pst = con.prepareStatement(
        "INSERT INTO staff (stid, name, email, phone, photo, dob, gender, joining_date, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
    );

    pst.setInt(1, Integer.parseInt(s1));
    pst.setString(2, s2);
    pst.setString(3, s3);
    pst.setString(4, s4);
    pst.setString(5, s5);
    pst.setString(6, s6);
    pst.setString(7, s7);
    pst.setString(8, s8);
    pst.setString(9, "Active");

    int rows = pst.executeUpdate();

    if (rows > 0) {
        out.println("<h2>✅ Registered successfully!</h2>");
    } else {
        out.println("<h2>❌ Registration failed.</h2>");
    }

    pst.close();
    con.close();
} catch (Exception e) {
    out.println("<h3>Error: " + e.getMessage() + "</h3>");
    e.printStackTrace(out);
}
%>

</body>
</html>
