package clientController;

import models.Product;
import dao.ProductDAO;
import dao.ProductDAOImpl;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Devin
 */
public class clientProductServlet extends HttpServlet {

    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       ServletContext context = getServletContext();
        ProductDAO productDAO = new ProductDAOImpl();

        try {
            List<Product> products = productDAO.getAllProductsWithImage(context);
            request.setAttribute("products", products);
            request.getRequestDispatcher("/pages/storepage.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database error when retrieving products", e);
        } catch (Exception ex) {
            Logger.getLogger(clientProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

}
