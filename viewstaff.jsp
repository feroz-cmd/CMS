<%@ page import="java.sql.*" %>
<html>
<body bgcolor="pink" text="blue">
<center><h1>Active Staff Details</h1></center>

<table border="1" width="900" align="center">
<tr bgcolor="lightblue">
    <th>Staff ID</th>
    <th>Staff Name</th>
    <th>Email</th>
    <th>Phone No</th>
    <th>Photo</th>
    <th>DOB</th>
    <th>Gender</th>
    <th>Joining Date</th>
    <th>Status</th>
</tr>

<%
try {
    // Load PostgreSQL Driver
    Class.forName("org.postgresql.Driver");

    // Connect to PostgreSQL (Render Database)
    Connection con = DriverManager.getConnection(
        "jdbc:postgresql://dpg-d46uvfumcj7s73ddk8ug-a.singapore-postgres.render.com/staffdb_vkwf",
        "staffdb_vkwf_user",
        "2jAtPgmq5jRb0IkOaMmdJE8IX89E90NO"
    );

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM staff WHERE status='Active'");

    while (rs.next()) {
        String photo = rs.getString("photo");
        if (photo == null || photo.trim().isEmpty()) {
            photo = "noimage.png";  // Default image
        }

        out.println("<tr>");
        out.println("<td>" + rs.getInt("stid") + "</td>");
        out.println("<td>" + rs.getString("name") + "</td>");
        out.println("<td>" + rs.getString("email") + "</td>");
        out.println("<td>" + rs.getString("phone") + "</td>");
        out.println("<td><img src='" + photo + "' width='100' height='100'></td>");
        out.println("<td>" + rs.getDate("dob") + "</td>");
        out.println("<td>" + rs.getString("gender") + "</td>");
        out.println("<td>" + rs.getDate("joining_date") + "</td>");
        out.println("<td>" + rs.getString("status") + "</td>");
        out.println("</tr>");
    }

    rs.close();
    st.close();
    con.close();

} catch (Exception e) {
    out.println("<h3 style='color:red;'>⚠ Error: " + e.getMessage() + "</h3>");
}
%>

</table>
</body>
</html>
