package dao;

import models.Product;
import java.util.List;
import models.Admin;
import models.Order;

/**
 *
 * @author Devin
 */
public interface AdminDAO {
    Admin loginAdmin(String email, String password) throws Exception;
    int fetchSalesCount() throws Exception;
    int fetchProductsCount() throws Exception;
    int fetchUsersCount() throws Exception;
    int fetchTotalCost() throws Exception;
    List<Product> fetchTopSellingProducts() throws Exception;
    List<Order> fetchRecentOrders() throws Exception;
}
