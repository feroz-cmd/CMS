<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<html>
<head>
<title>Staff Registration</title>
</head>
<body bgcolor="pink" text="blue">
<form action="addstaff1.jsp" method="get">
<center><h1>Staff Registration</h1></center>

<%
int no = 0;
Connection con = null;
Statement st = null;
ResultSet rs = null;

try {
    // Load PostgreSQL driver
    Class.forName("org.postgresql.Driver");

    // Connect to Render PostgreSQL database
    con = DriverManager.getConnection(
        "jdbc:postgresql://dpg-d46uvfumcj7s73ddk8ug-a:5432/staffdb_vkwf",
        "staffdb_vkwf_user",
        "2jAtPgmq5jRb0IkOaMmdJE8IX89E90NO"
    );

    // Query for next available staff ID
    st = con.createStatement();
    rs = st.executeQuery("SELECT COALESCE(MAX(stid), 10000) + 1 AS next_id FROM staff");

    if (rs.next()) {
        no = rs.getInt("next_id");
    } else {
        no = 10001;
    }

} catch (Exception e) {
    e.printStackTrace();
    no = 10001; // fallback if error occurs
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (st != null) st.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
}

// Store ID in session for use in next page
session.setAttribute("sid", String.valueOf(no));
%>

<center>
<table border="1" cellpadding="5" cellspacing="0" style="border-collapse:collapse;">
<tr>
    <th>Staff Id</th>
    <td><input type="text" name="t1" value="<%=no%>" readonly></td>
</tr>

<tr>
    <th>Staff Name</th>
    <td><input type="text" name="t2" required></td>
</tr>

<tr>
    <th>Email</th>
    <td><input type="email" name="t3" required></td>
</tr>

<tr>
    <th>Phone</th>
    <td><input type="tel" name="t4" pattern="[0-9]{10}" required></td>
</tr>

<tr>
    <th>Photo</th>
    <td><input type="file" name="t5" accept="image/*"></td>
</tr>

<tr>
    <th>DOB</th>
    <td><input type="date" name="t6" required></td>
</tr>

<tr>
    <th>Gender</th>
    <td>
        <select name="t7" required>
            <option value="">--Select--</option>
            <option>Male</option>
            <option>Female</option>
            <option>Others</option>
        </select>
    </td>
</tr>

<tr>
    <th>Joining Date</th>
    <%
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        String str = sd.format(new java.util.Date());
        session.setAttribute("date", str);
    %>
    <td><input type="text" name="t8" value="<%=str%>" readonly></td>
</tr>
</table>

<br>
<input type="submit" value="REGISTER"
       style="padding:10px 20px; background-color:blue; color:white; border:none; border-radius:5px; font-weight:bold;">
</center>

</form>
</body>
</html>
