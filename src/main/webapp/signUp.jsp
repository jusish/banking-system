<%--
  Created by IntelliJ IDEA.
  User: jodos
  Date: 12/02/2024
  Time: 5:13 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>sign-up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
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
        input[type="number"],
        input[type="password"],select {
            display: block;
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
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
<h1>Sign-up</h1>

<form action="signUp" method="post">
    <input type="text" name="username" id="username" placeholder="Username"/>

    <input type="email" name="email" id="email" placeholder="Email"/>
    <input type="password" name="password" id="password" placeholder="Password"/>
    <input type="number" name="age" id="age" placeholder="age"/>
    <input type="number" name="amout" id="amount" placeholder="amount"/>
    <select name="bankType" id="bankType">
        <option value="saving account">current account</option>
        <option value="saving account">saving account</option>
    </select>
    <input type="submit" value="Sign Up">
    <p>Already have an account? <a href="login.jsp">Login</a></p>
</form>
</body>
</html>