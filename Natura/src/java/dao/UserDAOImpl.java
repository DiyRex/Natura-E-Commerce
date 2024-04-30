package dao;

import models.User;
import utility.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {

    @Override
    public List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM user";
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            if (conn == null || conn.isClosed()) {
                System.err.println("Connection is closed or null");
            } else {
                try (Statement statement = conn.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {
                    while (resultSet.next()) {
                        users.add(new User(
                            resultSet.getInt("User_ID"),
                            resultSet.getString("Name"),
                            resultSet.getString("Contact"),
                            resultSet.getString("Apt_No"),
                            resultSet.getString("Street"),
                            resultSet.getString("City"),
                            resultSet.getString("State"),
                            resultSet.getString("ZipCode"),
                            resultSet.getString("Email")
                        ));
                    }
                }
            }
        } finally {
            if (conn != null) conn.close();
        }
        return users;
    }

    @Override
    public void addUser(User user) throws SQLException {
        String sql = "INSERT INTO user (Name, Contact, Apt_No, Street, City, State, ZipCode, Email, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getContact());
                stmt.setString(3, user.getApt_no());
                stmt.setString(4, user.getStreet());
                stmt.setString(5, user.getCity());
                stmt.setString(6, user.getState());
                stmt.setString(7, user.getZip_code());
                stmt.setString(8, user.getEmail());
                stmt.setString(9,user.getPassword());
                stmt.executeUpdate();
            }
        } finally {
            if (conn != null) conn.close();
        }
    }

    @Override
    public User getUser(int id) throws SQLException {
        String sql = "SELECT * FROM user WHERE User_ID = ?";
        Connection conn = null;
        User user = null;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, id);
                try (ResultSet resultSet = stmt.executeQuery()) {
                    if (resultSet.next()) {
                        user = new User(
                            resultSet.getInt("User_ID"),
                            resultSet.getString("Name"),
                            resultSet.getString("Contact"),
                            resultSet.getString("Apt_No"),
                            resultSet.getString("Street"),
                            resultSet.getString("City"),
                            resultSet.getString("State"),
                            resultSet.getString("ZipCode"),
                            resultSet.getString("Email")
                        );
                    }
                }
            }
        } finally {
            if (conn != null) conn.close();
        }
        return user;
    }

    @Override
    public void updateUser(User user) throws SQLException {
        String sql = "UPDATE user SET Name = ?, Contact = ?, Apt_No = ?, Street = ?, City = ?, State = ?, ZipCode = ?, Email = ? WHERE User_ID = ?";
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getContact());
                stmt.setString(3, user.getApt_no());
                stmt.setString(4, user.getStreet());
                stmt.setString(5, user.getCity());
                stmt.setString(6, user.getState());
                stmt.setString(7, user.getZip_code());
                stmt.setString(8, user.getEmail());
                stmt.setInt(9, user.getId());
                stmt.executeUpdate();
            }
        } finally {
            if (conn != null) conn.close();
        }
    }

    @Override
    public void deleteUser(int id) throws SQLException {
        String sql = "DELETE FROM user WHERE User_ID = ?";
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, id);
                stmt.executeUpdate();
            }
        } finally {
            if (conn != null) conn.close();
        }
    }

    @Override
    public User loginUser(String email, String password) throws Exception {
        String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
        Connection conn = null;
        User user = null;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2,password);
                try (ResultSet resultSet = stmt.executeQuery()) {
                    if (resultSet.next()) {
                        user = new User(
                            resultSet.getInt("User_ID"),
                            resultSet.getString("Name"),
                            resultSet.getString("Contact"),
                            resultSet.getString("Apt_No"),
                            resultSet.getString("Street"),
                            resultSet.getString("City"),
                            resultSet.getString("State"),
                            resultSet.getString("ZipCode"),
                            resultSet.getString("Email")
                        );
                    }
                }
            }
        } finally {
            if (conn != null) conn.close();
        }
        return user;
    }
}
