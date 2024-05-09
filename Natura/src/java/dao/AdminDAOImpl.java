package dao;

import models.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import models.Admin;
import models.Order;
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

    @Override
    public int fetchSalesCount() throws Exception {
        String sql = "SELECT COUNT(*) AS count FROM orders";
        Connection conn = null;
        int count = 0;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
             
                try (ResultSet resultSet = stmt.executeQuery()) {
                    if (resultSet.next()) {
                        count = resultSet.getInt("count");
                    }
                }
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }

    @Override
    public int fetchProductsCount() throws Exception {
       String sql = "SELECT COUNT(*) AS count FROM product";
        Connection conn = null;
        int count = 0;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
             
                try (ResultSet resultSet = stmt.executeQuery()) {
                    if (resultSet.next()) {
                        count = resultSet.getInt("count");
                    }
                }
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }

    @Override
    public int fetchUsersCount() throws Exception {
        String sql = "SELECT COUNT(*) AS count FROM user";
        Connection conn = null;
        int count = 0;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
             
                try (ResultSet resultSet = stmt.executeQuery()) {
                    if (resultSet.next()) {
                        count = resultSet.getInt("count");
                    }
                }
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }

    @Override
    public List<Product> fetchTopSellingProducts() throws Exception {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.Product_ID, p.Title, p.Description, p.Price, p.Qty, i.Image_Path "
                + "FROM product p LEFT JOIN image i ON p.Product_ID = i.Product_ID "
                + "ORDER BY p.Product_ID DESC LIMIT 8";

        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            if (conn == null || conn.isClosed()) {
                System.err.println("Connection is closed or null");
            } else {
                try (Statement statement = conn.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {
                    while (resultSet.next()) {

                        products.add(new Product(
                                resultSet.getInt("Product_ID"),
                                resultSet.getString("Title"),
                                resultSet.getString("Description"),
                                resultSet.getDouble("Price"),
                                resultSet.getInt("Qty"),
                                resultSet.getString("Image_Path")
                        ));
                    }
                }
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return products;
    }

    @Override
    public List<Order> fetchRecentOrders() throws Exception {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT Order_ID, User_ID, Total_Cost, Order_Status, Orderd_Date FROM orders ORDER BY Order_ID DESC LIMIT 10";

        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            if (conn == null || conn.isClosed()) {
                System.err.println("Connection is closed or null");
            } else {
                try (Statement statement = conn.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {
                    while (resultSet.next()) {
                        orders.add(new Order(
                                resultSet.getInt("Order_ID"),
                                resultSet.getInt("User_ID"),
                                resultSet.getInt("Total_Cost"),
                                resultSet.getString("Order_Status"),
                                resultSet.getString("Orderd_Date")
                        ));
                    }
                }
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return orders;
    }

    @Override
    public int fetchTotalCost() throws Exception {
        String sql = "SELECT SUM(Total_Cost) AS total FROM orders";
        Connection conn = null;
        int count = 0;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
             
                try (ResultSet resultSet = stmt.executeQuery()) {
                    if (resultSet.next()) {
                        count = resultSet.getInt("total");
                    }
                }
            }
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return count;
    }
}
