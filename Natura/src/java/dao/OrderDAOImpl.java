package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

    @Override
    public List<Order> fetchOrdersByUserId(int userId) {
        String sql = "SELECT o.Order_ID, o.User_ID, o.Shipping_Address, o.Payment, o.Total_Cost, o.Order_Status, o.Orderd_Date, "
                + "GROUP_CONCAT(CONCAT('Orditem_ID:', oi.Orditem_ID, '\n', 'Item:', p.Title, '\n', 'Qty:', oi.Qty, '\n', 'Price:', oi.Price) SEPARATOR '; ') AS Order_Items "
                + "FROM orders o JOIN order_items oi ON o.Order_ID = oi.Order_ID "
                + "JOIN product p ON p.Product_ID = oi.Product_ID "
                + "WHERE o.User_ID = ? GROUP BY o.Order_ID";
        List<Order> orders = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int orderId = rs.getInt("Order_ID");
                    String shippingAddress = rs.getString("Shipping_Address");
                    String payment = rs.getString("Payment");
                    int totalCost = rs.getInt("Total_Cost");
                    String orderStatus = rs.getString("Order_Status");
                    String orderDate = rs.getString("Orderd_Date");
                    String orderItemsString = rs.getString("Order_Items");
                    List<OrderItem> orderItems = parseAndAddOrderItems(orderItemsString);
                    Order order = new Order(orderId, userId, shippingAddress, payment, totalCost, orderStatus, orderDate, orderItems);
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
        }
        return orders;
    }
    
    @Override
    public List<Order> fetchAllOrders() {
        String sql = "SELECT o.Order_ID, u.Name, o.Shipping_Address, o.Payment, o.Total_Cost, o.Order_Status, o.Orderd_Date, "
                + "GROUP_CONCAT(CONCAT('Orditem_ID:', oi.Orditem_ID, '\n', 'Item:', p.Title, '\n', 'Qty:', oi.Qty, '\n', 'Price:', oi.Price) SEPARATOR '; ') AS Order_Items "
                + "FROM orders o JOIN order_items oi ON o.Order_ID = oi.Order_ID "
                + "JOIN product p ON p.Product_ID = oi.Product_ID "
                + "JOIN user u ON o.User_ID = u.User_ID "
                + "GROUP BY o.Order_ID";
        List<Order> orders = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int orderId = rs.getInt("Order_ID");
                    String userName = rs.getString("Name");
                    String shippingAddress = rs.getString("Shipping_Address");
                    String payment = rs.getString("Payment");
                    int totalCost = rs.getInt("Total_Cost");
                    String orderStatus = rs.getString("Order_Status");
                    String orderDate = rs.getString("Orderd_Date");
                    String orderItemsString = rs.getString("Order_Items");
                    List<OrderItem> orderItems = parseAndAddOrderItems(orderItemsString);
                    Order order = new Order(orderId, userName, shippingAddress, payment, totalCost, orderStatus, orderDate, orderItems);
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
        }
        return orders;
    }

    public static List<OrderItem> parseAndAddOrderItems(String orderItemsString) {
        List<OrderItem> items = new ArrayList<>();
        String[] itemDetails = orderItemsString.split("; ");
        for (String item : itemDetails) {
            String[] details = item.split("\n");
            int itemId = Integer.parseInt(details[0].split(":")[1].trim());
            String productTitle = details[1].split(":")[1].trim();
            int quantity = Integer.parseInt(details[2].split(":")[1].trim());
            int price = Integer.parseInt(details[3].split(":")[1].trim());

            OrderItem orderItem = new OrderItem(itemId, productTitle, quantity, price);
            items.add(orderItem);
        }
        return items;
    }

    @Override
    public void deleteOrder(int order_id) throws Exception {
       String sql = "DELETE FROM orders WHERE Order_ID = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, order_id);
            statement.executeUpdate();
        }
    }

    @Override
    public void updateOrderStatus(int order_id) throws Exception {
        String sql = "UPDATE orders SET Order_Status=? WHERE Order_ID=?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, "completed");
            statement.setInt(2, order_id);
            statement.executeUpdate();
        }
    }
}
