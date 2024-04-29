/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package adminController.dao;
import adminController.models.Product;
import java.util.List;

public interface ProductDAO {
    int addProduct(Product product) throws Exception;
    Product getProduct(int id) throws Exception;
    List<Product> getAllProducts() throws Exception;
    void updateProduct(Product product) throws Exception;
    void deleteProduct(int id) throws Exception;
    void addProductImage(int productId, String imagePath) throws Exception;
}
