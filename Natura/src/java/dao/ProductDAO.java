package dao;
import models.Product;
import java.util.List;

public interface ProductDAO {
    Product getProduct(int id) throws Exception;
    List<Product> getAllProducts() throws Exception;
    void updateProduct(Product product) throws Exception;
    void deleteProduct(int id) throws Exception;
    void addProduct(Product product, String imagePath) throws Exception;
}
