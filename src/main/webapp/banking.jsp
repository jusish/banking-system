<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to Your Banking Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 10px;
            color: #888888;
        }

        form {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #888888;
        }

        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }

        h3 {
            text-align: center;
            margin-bottom: 10px;
            color: #888888;
        }

        .success-message {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 10px;
        }

        .error-message {
            text-align: center;
            color: #ff4d4d;
            margin-bottom: 10px;
        }

        form.logout-form {
            text-align: center;
        }

        button.logout-button {
            padding: 10px 20px;
            background-color: #ff4d4d;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button.logout-button:hover {
            background-color: #e63939;
        }

        button.withdraw-button {
            background-color: #ff4d4d;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome <%=session.getAttribute("username") %> to Your Banking Account</h1>

    <c:if test="${not empty amount}">
        <h3>Your current bank amount is: <span style="color: #4CAF50;">${amount}</span></h3>
    </c:if>

    <h2>Want to deposit?</h2>
    <form action="deposit" method="post">
        <label for="amount">Enter Deposit Amount:</label>
        <input type="number" id="amount" name="depositAmount" required><br>
        <button type="submit">Deposit</button>
    </form>

<%--    fail withdraw--%>
    <c:if test="${not empty depositError}">
        <p class="error-message">${depositError}</p>
    </c:if>

<%--    success withdraw--%>
    <c:if test="${not empty successDeposit}">
        <p class="success-message">${successDeposit}</p>
    </c:if>

    <h2>Want to withdraw?</h2>
    <form action="withdraw" method="post">
        <label for="withdraw">Enter Withdraw Amount:</label>
        <input type="number" id="withdraw" name="withdraw" required><br>
        <button type="submit" class="withdraw-button">Withdraw</button>
    </form>

<%--    withdraw error --%>
    <c:if test="${not empty withdrawError}">
        <p class="error-message">${withdrawError}</p>
    </c:if>

<%--    success withdraw--%>
    <c:if test="${not empty successMessage}">
        <p class="success-message">${successMessage}</p>
    </c:if>

<%--    logout--%>
    <form action="logout" method="post" class="logout-form">
        <button type="submit" class="logout-button">Logout</button>
    </form>
    <p>done by @jodos</p>
</div>
</body>
</html>