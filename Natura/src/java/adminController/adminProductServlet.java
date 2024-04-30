package adminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ProductDAO;
import dao.ProductDAOImpl;
import models.Product;
import javax.servlet.annotation.WebServlet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Devin
 */
public class adminProductServlet extends HttpServlet {


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       ProductDAO productDAO = new ProductDAOImpl();
        try {
            List<Product> allProducts = productDAO.getAllProducts();
            request.setAttribute("products", allProducts);  // Set the products in the request scope
            request.getRequestDispatcher("/pages/admin/products.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving products", e);
        } catch (Exception ex) {
            Logger.getLogger(adminProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
