package com.mvc.bankingsystem;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

@WebFilter("/signUp")
public class SignUpFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        int age =Integer.parseInt(req.getParameter("age"));
        String bankType = req.getParameter("bankType");

        if (username == null || username.trim().isEmpty()) {
            // Handle invalid username
            request.setAttribute("error", "Username is required");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (email == null || email.trim().isEmpty()) {
            // Handle invalid email
            request.setAttribute("error", "Email is required");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (password == null || password.isEmpty()) {
            // Handle invalid password
            request.setAttribute("error", "Password is required");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (age < 18){
            request.setAttribute("error", " age must be equal to 18 or greater ");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (bankType == null || bankType.trim().isEmpty()) {
            // Handle invalid bankType
            request.setAttribute("error", "Bank type is required");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Validate bankType (must be "current account" or "saving account")
        if (!bankType.equalsIgnoreCase("current account") && !bankType.equalsIgnoreCase("saving account")) {
            // Handle invalid bankType
            request.setAttribute("error", "Bank type must be either 'current account' or 'saving account'");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // If all parameters are valid, continue with the filter chain
        chain.doFilter(request, response);
    }
}