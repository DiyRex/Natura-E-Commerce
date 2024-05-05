package dao;

import java.sql.SQLException;
import java.util.List;
import models.OrderItem;

/**
 *
 * @author Devin
 */
public interface OrderItemDAO {
    void createOrderItems(List<OrderItem> items) throws SQLException;
}
