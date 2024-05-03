package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Cart;
import utility.DBConnection;

/**
 *
 * @author Devin
 */
public class CartDAOImpl implements CartDAO {

    @Override
    public List<Cart> getCartProducts(String userId) throws SQLException {
        List<Cart> carts = new ArrayList<>();
        String sql = "SELECT ci.Item_ID AS Item_ID, p.Title AS ProductName, p.Price AS ProductPrice, ci.Qty AS Quantity, c.Cart_ID AS CartId, p.Product_ID AS ProductID "
                + "FROM user u "
                + "JOIN cart c ON u.User_ID = c.User_ID "
                + "JOIN cart_items ci ON c.Cart_ID = ci.Cart_ID "
                + "JOIN product p ON ci.Product_ID = p.Product_ID "
                + "WHERE u.User_ID = ?";

        try (Connection conn = DBConnection.getConnection(); // Adjust DBConnection to your actual connection class
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, userId); // Set the user ID parameter

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int Item_ID = rs.getInt("Item_ID");
                    String productName = rs.getString("ProductName");
                    double productPrice = rs.getDouble("ProductPrice");
                    int quantity = rs.getInt("Quantity");
                    int cartId = rs.getInt("CartId");
                    int productID = rs.getInt("ProductID");
                    

                    // Assuming Cart constructor: Cart(int user_id, int cart_id, String product, double price, int qty)
                    Cart cart = new Cart(Item_ID, Integer.parseInt(userId), cartId, productID, productName, (int) productPrice, quantity);
                    carts.add(cart);
                }
            }
        }
        return carts;
    }

    @Override
    public void deleteItem(int id) throws Exception {
        String sql = "DELETE FROM cart_items WHERE Item_ID = ?;";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Item deleted successfully!");
            } else {
                System.out.println("No item found with ID: " + id);
            }
        } catch (SQLException e) {
            System.err.println("SQL error occurred: " + e.getMessage());
        }
    }

    @Override
    public void addOrUpdate( int productId, int cartId, int newQuantity) throws SQLException {
        Connection conn = null;
        PreparedStatement selectStmt = null;
        PreparedStatement updateStmt = null;
        ResultSet rs = null;

        String selectSql = "SELECT Qty FROM cart_items WHERE Cart_ID = ? AND Product_ID = ?";
        String updateSql = "UPDATE cart_items SET Qty = Qty + ? WHERE Cart_ID = ? AND Product_ID = ?";

        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // Start transaction

            // Check if the product already exists in the cart
            selectStmt = conn.prepareStatement(selectSql);
            selectStmt.setInt(1, cartId);
            selectStmt.setInt(2, productId);
            rs = selectStmt.executeQuery();

            if (rs.next()) {
                int currentQty = rs.getInt("Qty");
                System.out.println("Current Quantity: " + currentQty);

                // Product exists, update quantity
                updateStmt = conn.prepareStatement(updateSql);
                updateStmt.setInt(1, newQuantity);
                updateStmt.setInt(2, cartId);
                updateStmt.setInt(3, productId);
                int affectedRows = updateStmt.executeUpdate();
                System.out.println("Updated rows: " + affectedRows);
            } else {
                System.out.println("Product does not exist in the cart, no update performed.");
            }

            conn.commit(); // Commit transaction
        } catch (SQLException ex) {
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback transaction on error
                    System.out.println("Transaction rollback executed.");
                } catch (SQLException e) {
                    System.out.println("Rollback failed: " + e.getMessage());
                    e.printStackTrace();
                }
            }
            ex.printStackTrace();
            throw ex; // Rethrow the exception to handle it further up the call stack
        } finally {
            // Close all resources
            if (rs != null) {
                rs.close();
            }
            if (selectStmt != null) {
                selectStmt.close();
            }
            if (updateStmt != null) {
                updateStmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}
