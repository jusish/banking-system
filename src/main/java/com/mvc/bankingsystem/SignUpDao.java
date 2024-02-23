package com.mvc.bankingsystem;

import java.sql.*;

public class SignUpDao {
    String url = "jdbc:postgresql://localhost:5432/work";
    String username = "jodos";
    String password = "jodos2006";
    String sql = "SELECT * FROM  users where email=? ";

    public boolean checkEmail(String email) {
        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
