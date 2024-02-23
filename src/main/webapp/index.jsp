<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome to the Banking System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        .container {
            flex-direction: column;
            max-width: 400px;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: black;
        }

        .button {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #006585;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            padding: 10px;

        }

        .button:hover {
            background-color: #0082b4;
        }

        p {
            text-align: center;
            margin-top: 20px;
        }

        .extra-text {
            text-align: center;
            margin-top: 30px;
            color: #888888;
        }

        a {
            color: blue;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to our System</h1>
    <div>
        <a href="login.jsp" class="button">Login</a>
        <a href="signUp.jsp" class="button">Register</a>
    </div>


    <p>Already have an account? <a href="login.jsp">Login</a></p>

</div>
</body>
</html>