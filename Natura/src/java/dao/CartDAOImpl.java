/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
        String sql = "SELECT p.Title AS ProductName, p.Price AS ProductPrice, ci.Qty AS Quantity, c.Cart_ID AS CartId "
                + "FROM user u JOIN cart c ON u.User_ID = c.User_ID "
                + "JOIN cart_items ci ON c.Cart_ID = ci.Cart_ID "
                + "JOIN product p ON ci.Product_ID = p.Product_ID "
                + "WHERE u.User_ID = ?";

        try (Connection conn = DBConnection.getConnection(); // Adjust DBConnection to your actual connection class
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, userId); // Set the user ID parameter

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String productName = rs.getString("ProductName");
                    double productPrice = rs.getDouble("ProductPrice");
                    int quantity = rs.getInt("Quantity");
                    int cartId = rs.getInt("CartId");

                    // Assuming Cart constructor: Cart(int user_id, int cart_id, String product, double price, int qty)
                    Cart cart = new Cart(Integer.parseInt(userId), cartId, productName, (int) productPrice, quantity);
                    carts.add(cart);
                }
            }
        }
        return carts;
    }

    @Override
    public void deleteItem(int id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void addOrUpdate(String userId, int productId, int newQuantity) throws SQLException {
        // SQL to check existence of product in cart
        String checkSql = "SELECT Qty FROM cart_items WHERE Cart_ID = (SELECT Cart_ID FROM cart WHERE User_ID = ?) AND Product_ID = ?";

        // SQL to update existing product quantity in cart
        String updateSql = "UPDATE cart_items SET Qty = ? WHERE Cart_ID = (SELECT Cart_ID FROM cart WHERE User_ID = ?) AND Product_ID = ?";

        // SQL to insert new product into cart
        String insertSql = "INSERT INTO cart_items (Cart_ID, Product_ID, Qty) VALUES ((SELECT Cart_ID FROM cart WHERE User_ID = ?), ?, ?)";

        try (Connection conn = DBConnection.getConnection(); // Adjust DBConnection to your actual connection class
                 PreparedStatement checkStmt = conn.prepareStatement(checkSql); PreparedStatement updateStmt = conn.prepareStatement(updateSql); PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {

            // Set parameters for checking existence
            checkStmt.setString(1, userId);
            checkStmt.setInt(2, productId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Product exists, update quantity
                int existingQty = rs.getInt("Qty");
                int updatedQty = existingQty + newQuantity; // Update logic, adjust as necessary

                updateStmt.setInt(1, updatedQty);
                updateStmt.setString(2, userId);
                updateStmt.setInt(3, productId);
                updateStmt.executeUpdate();
            } else {
                // Product does not exist, insert new row
                insertStmt.setString(1, userId);
                insertStmt.setInt(2, productId);
                insertStmt.setInt(3, newQuantity);
                insertStmt.executeUpdate();
            }
        }
    }

}
