package adminController.dao;
import adminController.models.Product;
import utility.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements ProductDAO {

    @Override
    public int addProduct(Product product) throws SQLException {
        int productId = 0;
        String sql = "INSERT INTO product (Title, Description, Price, Qty) VALUES (?, ?, ?, ?)";
         try (Connection conn = DBConnection.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {  // Request generated keys

            statement.setString(1, product.getTitle());
            statement.setString(2, product.getDescription());
            statement.setDouble(3, product.getPrice());
            statement.setInt(4, product.getQty());

            int affectedRows = statement.executeUpdate();

            if (affectedRows > 0) {
                // Retrieve the generated key (ID)
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        productId = generatedKeys.getInt(1);  // Get first column of the ResultSet, should be the ID
                    } else {
                        throw new SQLException("Creating product failed, no ID obtained.");
                    }
                }
            }
        }

        return productId;  // Return the product ID
    }

    @Override
    public Product getProduct(int id) throws SQLException {
        String sql = "SELECT * FROM product WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
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
        try (Connection conn = DBConnection.getConnection();
             Statement statement = conn.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
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
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
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
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }
    @Override
    public void addProductImage(int productId, String imagePath) throws SQLException {
    Connection conn = DBConnection.getConnection();
    String sql = "INSERT INTO images (Product_ID, Image_Path) VALUES (?, ?)";
    try (PreparedStatement statement = conn.prepareStatement(sql)) {
        statement.setInt(1, productId);
        statement.setString(2, imagePath);
        int rowsInserted = statement.executeUpdate();
        if (rowsInserted > 0) {
            System.out.println("Image was inserted successfully!");
        }
    }
}
}
