package com.mvc.bankingsystem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet("/deposit")
public class DepositServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("username");
        double changeAmount = Integer.parseInt(req.getParameter("depositAmount"));
        double newAmount = withDrawAmount(email, changeAmount);
        if (newAmount == 0) {
            req.setAttribute("depositError", "error during deposit new  amount");
            req.getRequestDispatcher("banking.jsp").forward(req, res);
        }

        req.setAttribute("successDeposit","you have deposited  money successfully");
        req.setAttribute("amount",newAmount);
        req.getRequestDispatcher("banking.jsp").forward(req,res);
    }

    protected double withDrawAmount(String email, double changeAmount) {
        String url = "jdbc:postgresql://localhost:5432/work";
        String usernameDb = "jodos";
        String passwordDb = "jodos2006";

        String selectQuery = "SELECT amount FROM users WHERE email = ?";
        String updateQuery = "UPDATE users SET amount = ? WHERE email = ?";
        try {
            Class.forName("org.postgresql.Driver");

            Connection con = DriverManager.getConnection(url, usernameDb, passwordDb);
            PreparedStatement selectStatement = con.prepareStatement(selectQuery);
            selectStatement.setString(1, email);
            ResultSet resultSet = selectStatement.executeQuery();
            if (resultSet.next()) {
                double currentAmount = resultSet.getDouble("amount");
                double newAmount = currentAmount + changeAmount;
                PreparedStatement updateStatement = con.prepareStatement(updateQuery);
                updateStatement.setDouble(1, newAmount);
                updateStatement.setString(2, email);
                updateStatement.executeUpdate();
                return newAmount;
            }

            return 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
