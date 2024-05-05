package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Order;
import models.OrderItem;
import utility.DBConnection;

/**
 *
 * @author Devin
 */
public class OrderDAOImpl implements OrderDAO {

    @Override
    public int createOrder(Order order) {
        String generatedColumns[] = {"Order_ID"};
        String sql = "INSERT INTO orders (User_ID, Shipping_Address, Payment, Total_Cost, Order_Status) VALUES (?, ?, ?, ?, ?)";
        Connection conn = null;
        int inserted_id = 0;
        try {
            conn = DBConnection.getConnection();
            try (PreparedStatement stmt = conn.prepareStatement(sql, generatedColumns)) {
                stmt.setInt(1, order.getUser_id());
                stmt.setString(2, order.getShipping_Address());
                stmt.setString(3, order.getPayment());
                stmt.setInt(4, order.getTotal_cost());
                stmt.setString(5, order.getOrder_status());
                stmt.executeUpdate();
                ResultSet rs = stmt.getGeneratedKeys();

                if (rs.next()) {
                    long id = rs.getLong(1);
//                    System.out.println("Inserted ID -" + id);
                    inserted_id = (int) id;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return inserted_id;
    }

    @Override
    public void createOrderItems(int order_id, int product_id, int qty, int price) {

    }

    
}
