package dao;

import java.sql.SQLException;
import java.util.List;
import models.Order;

/**
 *
 * @author Devin
 */
public interface OrderDAO {
    int createOrder(Order order) throws SQLException;
    void createOrderItems(int order_id, int product_id, int qty, int price) throws SQLException;
    List<Order> fetchOrdersByUserId(int user_id) throws SQLException;
    void deleteOrder(int order_id) throws Exception;
    List<Order> fetchAllOrders() throws Exception;
    void updateOrderStatus(int order_id) throws Exception;
}
