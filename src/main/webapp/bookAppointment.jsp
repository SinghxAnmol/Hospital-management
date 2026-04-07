<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.bookappointment.dao.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Book Appointment</title>

<style>

/* BACKGROUND */
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(to right, #4facfe, #00f2fe);
}

/* NAVBAR */
.navbar {
    padding: 15px 30px;
    color: white;
    display: flex;
    justify-content: space-between;
}

.navbar a {
    color: white;
    margin-left: 20px;
    text-decoration: none;
    font-weight: bold;
}

/* CENTER BOX */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 90vh;
}

/* GLASS EFFECT */
.box {
    width: 420px;
    padding: 30px;
    border-radius: 15px;
    background: rgba(255,255,255,0.2);
    backdrop-filter: blur(10px);
    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    color: white;
}

/* TITLE */
.box h2 {
    text-align: center;
    margin-bottom: 20px;
}

/* INPUTS */
input, select, textarea {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border: none;
    border-radius: 8px;
    outline: none;
    box-sizing: border-box; /* ? IMPORTANT FIX */
    font-size: 14px;
}

/* BUTTON */
button {
    width: 100%;
    padding: 12px;
    border: none;
    background: white;
    color: #4facfe;
    font-weight: bold;
    border-radius: 20px;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    background: #007bff;
    color: white;
}
select {
    appearance: none;
}
/* LABEL */
label {
    font-size: 14px;
}

/* ICON TEXT */
.heading-icon {
    text-align: center;
    font-size: 40px;
}

</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div><strong>Hospital System</strong></div>
    <div>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="history.jsp">History</a>
    </div>
</div>

<div class="container">

<div class="box">
<h2>Book Appointment</h2>

<form action="AppointmentServlet" method="post">

<!-- Doctor -->
<label>Select Doctor</label>
<select name="doctor_id" required>
    <option value="">Choose Doctor</option>
    <%
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM doctors");

        while(rs.next()) {
    %>
    <option value="<%=rs.getInt("id")%>">
        <%=rs.getString("name")%> - <%=rs.getString("specialization")%>
    </option>
    <% } %>
</select>

<!-- Date -->
<label>Select Date</label>
<input type="date" name="date" required>

<!-- Time -->
<label>Select Time Slot</label>
<select name="time" required>
    <option value="">Choose Time</option>
    <option>10:00 AM</option>
    <option>11:00 AM</option>
    <option>12:00 PM</option>
    <option>02:00 PM</option>
    <option>03:00 PM</option>
</select>

<!-- Symptoms -->
<label>Symptoms</label>
<textarea name="symptoms" placeholder="Describe your problem..."></textarea>

<button type="submit">Book Appointment</button>

</form>

</div>
</div>

</body>
</html>