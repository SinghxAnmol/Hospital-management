<%@ page language="java" %>

<!DOCTYPE html>
<html>
<head>
<title>Error</title>

<style>

body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(to right, #ff416c, #ff4b2b);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* BOX */
.box {
    background: white;
    padding: 40px;
    border-radius: 15px;
    text-align: center;
    width: 400px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
}

/* ICON */
.icon {
    font-size: 60px;
}

/* TEXT */
h2 {
    color: #ff4b2b;
}

p {
    color: #555;
}

/* BUTTON */
button {
    margin-top: 20px;
    padding: 10px 20px;
    border: none;
    background: #ff4b2b;
    color: white;
    border-radius: 20px;
    cursor: pointer;
}

button:hover {
    background: #e63e1d;
}

</style>

</head>

<body>

<div class="box">

<h2>Something Went Wrong</h2>

<%
    String backPage = (String) request.getAttribute("backPage");
    if (backPage == null) {
        backPage = "dashboard.jsp"; // default fallback
    }
%>

<a href="<%= backPage %>">
    <button>Go Back</button>
</a>
</div>

</body>
</html>