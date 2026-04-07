<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.bookappointment.dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Appointment History</title>

<style>

body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f4f7fb;
}

/* NAVBAR */
.navbar {
    background: linear-gradient(45deg, #4facfe, #00f2fe);
    padding: 15px;
    color: white;
    display: flex;
    justify-content: space-between;
}

.navbar a {
    color: white;
    margin: 0 15px;
    text-decoration: none;
    font-weight: bold;
}

.navbar a:hover {
    text-decoration: underline;
}

/* CONTAINER */
.container {
    padding: 30px;
}

/* CARD */
.card {
    background: white;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

/* TABLE */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th {
    background: #4facfe;
    color: white;
    padding: 12px;
}

td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

tr:hover {
    background: #f1f9ff;
}

/* STATUS BADGES */
.status {
    padding: 6px 12px;
    border-radius: 20px;
    color: white;
    font-size: 12px;
}

.pending {
    background: orange;
}

.cancelled {
    background: red;
}

.completed {
    background: green;
}

/* BUTTON */
button {
    padding: 6px 12px;
    border: none;
    border-radius: 6px;
    background: #ff4d4d;
    color: white;
    cursor: pointer;
}

button:hover {
    background: #cc0000;
}

/* EMPTY MESSAGE */
.empty {
    text-align: center;
    padding: 30px;
    color: gray;
}

</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div>
        <strong>Hospital System</strong>
    </div>
    <div>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="bookAppointment.jsp">Book Appointment</a>
        <a href="history.jsp">History</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<!-- CONTENT -->
<div class="container">
<div class="card">

<h2>Appointment History</h2>

<table>
<tr>
<th>Doctor</th>
<th>Date</th>
<th>Time</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
int userId = (int) session.getAttribute("userId");

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT a.id, d.name, a.appointment_date, a.time, a.status FROM appointments a JOIN doctors d ON a.doctor_id=d.id WHERE user_id=?"
);

ps.setInt(1, userId);
ResultSet rs = ps.executeQuery();

boolean hasData = false;

while(rs.next()) {
    hasData = true;

    String status = rs.getString("status");
    String statusClass = "";

    if(status.equalsIgnoreCase("Pending")) statusClass = "pending";
    else if(status.equalsIgnoreCase("Cancelled")) statusClass = "cancelled";
    else statusClass = "completed";
%>

<tr>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("appointment_date")%></td>
<td><%=rs.getString("time")%></td>

<td>
<span class="status <%=statusClass%>">
    <%=status%>
</span>
</td>

<td>
<% if(!status.equals("Cancelled")) { %>
<form action="CancelServlet" method="post">
<input type="hidden" name="id" value="<%=rs.getInt("id")%>">
<button type="submit">Cancel</button>
</form>
<% } else { %>
<span style="color:gray;">?</span>
<% } %>
</td>

</tr>

<% } %>

</table>

<% if(!hasData) { %>
<div class="empty">
    <h3>No appointments found</h3>
    <p>Book your first appointment now!</p>
</div>
<% } %>

</div>
</div>

</body>
</html>