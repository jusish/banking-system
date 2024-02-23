package com.mvc.bankingsystem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet {
    // private RequestDispatcher dispatcher;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");

        String password = req.getParameter("password");
        int age = Integer.parseInt(req.getParameter("age"));
        int amount = Integer.parseInt(req.getParameter("amount"));

        String bankType = req.getParameter("bankType");
        SignUpDao signUpDao = new SignUpDao();
        if (signUpDao.checkEmail(email)) {
            req.setAttribute("error", "Email already exists");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/error.jsp");
            dispatcher.forward(req, res);

        }
        String resultSet = insertData(username, email, password, age, bankType,amount);

        if (resultSet.equalsIgnoreCase("user have been created successfully")) {
            System.out.println(resultSet);
            req.setAttribute("success", "you have created account successfully");
            RequestDispatcher dispatcher1 = req.getRequestDispatcher("/success.jsp");
            dispatcher1.forward(req, res);
        } else {
            req.setAttribute("error", "error during creating user");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/error.jsp");
            dispatcher.forward(req, res);
        }


    }

    private String insertData(String username, String email, String password, int age, String bankType, int amount) {
        String url = "jdbc:postgresql://localhost:5432/work";
        String usernameDb = "jodos";
        String passwordDb = "jodos2006";
        String sql = "INSERT INTO users (username,email,password,age,bankType) VALUES(?,?,?,?,?,?)";
        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(url, usernameDb, passwordDb);
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, email);
            st.setString(3, password);
            st.setInt(4, age);
            st.setString(5, bankType);
            st.setInt(6, amount);
            int res = st.executeUpdate();
            if (res == 1) {
                return "user have been created successfully";
            } else {
                return "user have been not created "
                        ;
            }

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
