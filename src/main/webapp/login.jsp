<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 50px;
            color: black;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="email"],
        input[type="password"], select {
            display: block;
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; /* Add this line */
        }

        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #006585;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        p {
            text-align: center;
        }

        a {
            color: blue;
        }
    </style>
</head>
<body>
<h1>Login</h1>
<form action="login" method="post">
    <input type="email" name="email" id="email" placeholder="Email"/>
    <input type="password" name="password" id="password" placeholder="Password"/>
    <select name="bankType" id="bankType">
        <option value="saving account">current account</option>
        <option value="saving account">saving account</option>
    </select>
    <input type="submit" value="Login">
    <p>Don't have an account? <a href="signUp.jsp">Sign Up</a></p>
</form>
</body>
</html>