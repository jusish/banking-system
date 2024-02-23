<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Success</title>
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
            color: #4CAF50;
            font-size: 30px;
        }

        .success-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .success-message {
            color: #4CAF50;
            text-align: center;
            font-size: 20px;
        }

        .emoji {
            font-size: 40px;
            margin-bottom: 10px;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>
<div class="success-container">
    <h1>Success</h1>
    <p class="success-message"><span class="emoji">🎉</span> ${success}</p>
    <p class="login-link">Now you can <a href="login.jsp">login</a> to your account.</p>
</div>
</body>
</html>