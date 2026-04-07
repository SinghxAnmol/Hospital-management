<!DOCTYPE html>
<html>
<head>
    <title>Hospital System</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: white;
            padding: 40px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 300px;
        }

        h1 {
            margin-bottom: 30px;
            color: #333;
        }

        a {
            display: block;
            text-decoration: none;
            background: #4facfe;
            color: white;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            font-size: 16px;
            transition: 0.3s;
        }

        a:hover {
            background: #00c6ff;
            transform: scale(1.05);
        }

        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #777;
        }
    </style>
</head>

<body>

    <div class="container">
        <h1>Hospital Appointment System</h1>

        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>

        <div class="footer">
            © 2026 Hospital System
        </div>
    </div>

</body>
</html>