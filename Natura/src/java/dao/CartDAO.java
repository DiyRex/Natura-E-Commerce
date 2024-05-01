package dao;

import java.util.List;
import models.Cart;
/**
 *
 * @author Devin
 */
public interface CartDAO {
    List<Cart> getCartProducts(String user_id) throws Exception;
    void deleteItem(int id) throws Exception;
    void addOrUpdate(int productId, int cartId, int newQuantity) throws Exception;
}
