<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<html>
<body bgcolor="pink" text="blue">
<form action="addstaff1.jsp" method="get">
<center><h1>Staff Registration</h1></center>

<%
int no = 0;
try {
    // Load PostgreSQL driver
    Class.forName("org.postgresql.Driver");

    // Connect to your Render PostgreSQL database
    Connection con = DriverManager.getConnection(
        "jdbc:postgresql://dpg-d46uvfumcj7s73ddk8ug-a:5432/staffdb_vkwf",
        "staffdb_vkwf_user",
        "2jAtPgmq5jRb0IkOaMmdJE8IX89E90NO"
    );

    // Query next available staff ID
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT COALESCE(MAX(stid), 10000) + 1 AS next_id FROM staff");
    
    if (rs.next()) {
        no = rs.getInt("next_id"); // get next ID directly
    }

    rs.close();
    st.close();
    con.close();
} catch (Exception e) {
    e.printStackTrace();
    no = 10001; // fallback if error occurs
}

// Store ID in session for use in next page
session.setAttribute("sid", String.valueOf(no));
%>

<center>
<table border="1" cellpadding="5" cellspacing="0">
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
        <select name="t7">
            <option>Male</option>
            <option>Female</option>
            <option>Others</option>
        </select>
    </td>
</tr>

<tr>
    <th>Joining Date</th>
    <%
        SimpleDateFormat sd = new SimpleDateFormat("dd-MM-yyyy");
        String str = sd.format(new Date());
        session.setAttribute("date", str); // save joining date in session
    %>
    <td><input type="text" name="t8" value="<%=str%>" readonly></td>
</tr>
</table>

<br>
<input type="submit" value="REGISTER" 
       style="padding:10px 20px; background-color:blue; color:white; border:none; border-radius:5px;">
</center>

</form>
</body>
</html>
