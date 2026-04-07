<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>

<style>

body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: #f0f4f8;
}

/* NAVBAR */
.navbar {
    background: linear-gradient(45deg, #4facfe, #00f2fe);
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: white;
}

.navbar h2 {
    margin: 0;
}

.navbar a {
    color: white;
    margin-left: 20px;
    text-decoration: none;
    font-weight: bold;
}

.navbar a:hover {
    text-decoration: underline;
}

/* HERO SECTION */
.hero {
    padding: 50px;
    text-align: center;
    background: linear-gradient(to right, #43e97b, #38f9d7);
    color: white;
}

.hero h1 {
    font-size: 40px;
    margin-bottom: 10px;
}

.hero p {
    font-size: 18px;
}

/* CONTAINER */
.container {
    padding: 30px;
}

/* CARDS */
.cards {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
}

.card {
    background: white;
    width: 260px;
    padding: 25px;
    margin: 15px;
    border-radius: 15px;
    text-align: center;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-10px) scale(1.03);
}

/* ICON */
.icon {
    font-size: 40px;
    margin-bottom: 10px;
}

/* BUTTON */
.btn {
    margin-top: 10px;
    padding: 10px 20px;
    border: none;
    background: #4facfe;
    color: white;
    border-radius: 20px;
    cursor: pointer;
}

.btn:hover {
    background: #007bff;
}

/* STATS */
.stats {
    display: flex;
    justify-content: space-around;
    margin-top: 40px;
}

.stat-box {
    background: white;
    padding: 20px;
    border-radius: 12px;
    width: 200px;
    text-align: center;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.stat-box h2 {
    margin: 0;
    color: #4facfe;
}

/* FOOTER */
.footer {
    text-align: center;
    padding: 20px;
    margin-top: 40px;
    color: gray;
}

</style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>Hospital System</h2>
    <div>
        <a href="dashboard.jsp">Home</a>
        <a href="bookAppointment.jsp">Book</a>
        <a href="history.jsp">History</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<!-- HERO -->
<div class="hero">
    <h1>Welcome to Smart Hospital System</h1>
    <p>Book appointments, manage schedules, and track your health easily.</p>
</div>

<!-- CONTENT -->
<div class="container">

<!-- CARDS -->
<div class="cards">

    <div class="card">
        <h3>Book Appointment</h3>
        <p>Schedule appointments with expert doctors quickly.</p>
        <a href="bookAppointment.jsp">
            <button class="btn">Book Now</button>
        </a>
    </div>

    <div class="card">
        <h3>View History</h3>
        <p>Check your previous and upcoming appointments.</p>
        <a href="history.jsp">
            <button class="btn">View</button>
        </a>
    </div>

    <div class="card">
        <h3>Quick Service</h3>
        <p>Fast booking system with real-time updates.</p>
        <button class="btn">Explore</button>
    </div>

</div>

<!-- STATS -->
<div class="stats">

    <div class="stat-box">
        <h2>50+</h2>
        <p>Doctors</p>
    </div>

    <div class="stat-box">
        <h2>200+</h2>
        <p>Patients Daily</p>
    </div>

    <div class="stat-box">
        <h2>24/7</h2>
        <p>Support</p>
    </div>

</div>

</div>

<!-- FOOTER -->
<div class="footer">
    © 2026 Hospital Management System | Designed by Anmol & Vishwendra
</div>

</body>
</html>