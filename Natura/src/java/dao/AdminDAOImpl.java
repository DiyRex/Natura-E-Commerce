package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.Admin;
import utility.DBConnection;

/**
 *
 * @author Devin
 */
public class AdminDAOImpl implements AdminDAO {
    @Override
    public Admin loginAdmin(String email, String password) throws Exception {
        String sql = "SELECT * FROM admin WHERE email = ? AND password = ?";
        Connection conn = null;
        Admin admin = null;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, password);
                try (ResultSet resultSet = stmt.executeQuery()) {
                    if (resultSet.next()) {
                        admin = new Admin(
                                resultSet.getInt("Admin_ID"),
                                resultSet.getString("Name"),
                                resultSet.getString("Contact"),
                                resultSet.getString("Email")
                        );
                    }
                }
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return admin;
    }
}
