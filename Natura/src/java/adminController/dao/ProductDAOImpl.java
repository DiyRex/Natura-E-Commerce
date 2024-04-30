package adminController.dao;

import adminController.models.Product;
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
        try (Connection conn = DBConnection.getConnection(); Statement statement = conn.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                products.add(new Product(
                        resultSet.getInt("id"),
                        resultSet.getString("title"),
                        resultSet.getString("description"),
                        resultSet.getDouble("price"),
                        resultSet.getInt("quantity")
                ));
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
        PreparedStatement productStatement = null;
        PreparedStatement imageStatement = null;
        ResultSet generatedKeys = null;

        String productSql = "INSERT INTO product (Title, Description, Price, Qty) VALUES (?, ?, ?, ?)";
        String imageSql = "INSERT INTO image (Product_ID, Image_Path) VALUES (?, ?)";

        try {
            // Start transaction
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false);  // Turn off auto-commit

            // Insert product
            productStatement = conn.prepareStatement(productSql, Statement.RETURN_GENERATED_KEYS);
            productStatement.setString(1, product.getTitle());
            productStatement.setString(2, product.getDescription());
            productStatement.setDouble(3, product.getPrice());
            productStatement.setInt(4, product.getQty());
            int affectedRows = productStatement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating product failed, no rows affected.");
            }

            // Retrieve the generated product ID
            generatedKeys = productStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int productId = generatedKeys.getInt(1);

                // Insert image with the newly created product ID
                imageStatement = conn.prepareStatement(imageSql);
                imageStatement.setInt(1, productId);
                imageStatement.setString(2, imagePath);
                int imageRows = imageStatement.executeUpdate();
                if (imageRows == 0) {
                    throw new SQLException("Creating product image failed, no rows affected.");
                }
                System.out.println("Image was inserted successfully!");
            } else {
                throw new SQLException("Creating product failed, no ID obtained.");
            }

            // Commit transaction
            conn.commit();
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();  // Roll back transaction on error
                } catch (SQLException ex) {
                    System.err.println("Rollback failed: " + ex.getMessage());
                }
            }
            System.err.println("SQL Error: " + e.getMessage());
            throw e;  // Propagate the exception
        } finally {
            // Clean up resources
            if (generatedKeys != null) try {
                generatedKeys.close();
            } catch (SQLException e) {
                /* ignored */ }
            if (productStatement != null) try {
                productStatement.close();
            } catch (SQLException e) {
                /* ignored */ }
            if (imageStatement != null) try {
                imageStatement.close();
            } catch (SQLException e) {
                /* ignored */ }
            if (conn != null) try {
                conn.setAutoCommit(true);
                conn.close();
            } catch (SQLException e) {
                /* ignored */ }
        }
    }

}
