package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import models.OrderItem;
import utility.DBConnection;

/**
 *
 * @author Devin
 */
public class OrderItemDAOImpl implements OrderItemDAO {
    
    @Override
    public void createOrderItems(List<OrderItem> items) throws SQLException {
        String sql = "INSERT INTO order_items (Order_ID, Product_ID, Qty, Price) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            conn.setAutoCommit(false);

            for (OrderItem item : items) {
                pstmt.setInt(1, item.getOrder_id());
                pstmt.setInt(2, item.getProduct_id());
                pstmt.setInt(3, item.getQty());
                pstmt.setInt(4, item.getPrice());
                pstmt.addBatch();
            }

            pstmt.executeBatch();
            conn.commit();
        } catch (SQLException e) {
            // Handle possible SQL exceptions here
            throw new RuntimeException("Error inserting order items", e);
        }
    }
}
