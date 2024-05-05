package dao;

import java.sql.SQLException;
import java.util.List;
import models.Order;
import models.OrderItem;

/**
 *
 * @author Devin
 */
public interface OrderDAO {
    int createOrder(Order order) throws SQLException;
    void createOrderItems(int order_id, int product_id, int qty, int price) throws SQLException;
}
