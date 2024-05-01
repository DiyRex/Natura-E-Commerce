package dao;

import javax.servlet.ServletContext;
import models.Product;
import utility.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {

    @Override
    public Product getProduct(int id) throws SQLException {
        String sql = "SELECT * FROM product WHERE id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return new Product(
                            resultSet.getInt("id"),
                            resultSet.getString("title"),
                            resultSet.getString("description"),
                            resultSet.getDouble("price"),
                            resultSet.getInt("quantity")
                    );
                }
            }
        }
        return null;
    }

    @Override
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product";
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
                                resultSet.getInt("Qty")
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
    public List<Product> getAllProductsWithImage(ServletContext context) throws SQLException {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT p.Product_ID, p.Title, p.Description, p.Price, p.Qty, i.Image_Path "
                + "FROM product p LEFT JOIN image i ON p.Product_ID = i.Product_ID";

        // Retrieve the upload directory from the web.xml configuration
        String uploadDir = context.getInitParameter("UPLOAD_DIRECTORY");

        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            if (conn == null || conn.isClosed()) {
                System.err.println("Connection is closed or null");
            } else {
                try (Statement statement = conn.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {
                    while (resultSet.next()) {
                        String imagePath = resultSet.getString("Image_Path");
                       
//                        if (imagePath != null && !imagePath.isEmpty()) {
//                            imagePath = uploadDir + "\\" + imagePath;  // Append the upload directory to the image path
//                            System.out.println(uploadDir);
//                            System.out.println(imagePath);
//                        }
                        products.add(new Product(
                                resultSet.getInt("Product_ID"),
                                resultSet.getString("Title"),
                                resultSet.getString("Description"),
                                resultSet.getDouble("Price"),
                                resultSet.getInt("Qty"),
                                imagePath // Use the modified image path
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
    public void updateProduct(Product product) throws SQLException {
        String sql = "UPDATE product SET title=?, description=?, price=?, quantity=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, product.getTitle());
            statement.setString(2, product.getDescription());
            statement.setDouble(3, product.getPrice());
            statement.setInt(4, product.getQty());
            statement.setInt(5, product.getId());
            statement.executeUpdate();
        }
    }

    @Override
    public void deleteProduct(int id) throws SQLException {
        String sql = "DELETE FROM product WHERE id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

@Override
public void addProduct(Product product, String imagePath) throws SQLException {
    Connection conn = null;
    PreparedStatement productStmt = null;
    PreparedStatement imageStmt = null;
    ResultSet rs = null;

    String productSql = "INSERT INTO product (Title, Description, Price, Qty) VALUES (?, ?, ?, ?)";
    String imageSql = "INSERT INTO image (Product_ID, Image_Path) VALUES (?, ?)";

    try {
        conn = DBConnection.getConnection();
        conn.setAutoCommit(false); // Start transaction

        // Insert product
        productStmt = conn.prepareStatement(productSql, Statement.RETURN_GENERATED_KEYS);
        productStmt.setString(1, product.getTitle());
        productStmt.setString(2, product.getDescription());
        productStmt.setDouble(3, product.getPrice());
        productStmt.setInt(4, product.getQty());
        int affectedRows = productStmt.executeUpdate();

        if (affectedRows == 0) {
            throw new SQLException("Creating product failed, no rows affected.");
        }

        // Retrieve product ID from inserted product
        rs = productStmt.getGeneratedKeys();
        if (rs.next()) {
            long productId = rs.getLong(1);

            // Insert image with the new product ID
            imageStmt = conn.prepareStatement(imageSql);
            imageStmt.setLong(1, productId);
            imageStmt.setString(2, imagePath);
            imageStmt.executeUpdate();
        } else {
            throw new SQLException("Creating product failed, no ID obtained.");
        }

        conn.commit(); // Commit transaction
    } catch (SQLException ex) {
        if (conn != null) {
            try {
                conn.rollback(); // Rollback transaction on error
            } catch (SQLException e) {
                throw new SQLException("Rollback failed.", e);
            }
        }
        throw ex;
    } finally {
        // Close all resources
        if (rs != null) {
            rs.close();
        }
        if (productStmt != null) {
            productStmt.close();
        }
        if (imageStmt != null) {
            imageStmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
}





}
