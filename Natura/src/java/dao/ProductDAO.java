package dao;
import models.Product;
import java.util.List;
import javax.servlet.ServletContext;

public interface ProductDAO {
    Product getProduct(int id) throws Exception;
    List<Product> getAllProducts() throws Exception;
    List<Product> getAllProductsWithImage(ServletContext context) throws Exception;
    void updateProduct(Product product) throws Exception;
    void deleteProduct(int id) throws Exception;
    void addProduct(Product product, String imagePath) throws Exception;
}
