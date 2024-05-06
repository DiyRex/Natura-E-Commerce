package clientController;

import dao.ProductDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Product;

/**
 *
 * @author Devin
 */
public class searchProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = null;
        String searchKey = request.getParameter("searchKey");
        request.setAttribute("pageTitle", searchKey);
        ProductDAOImpl product_dao = new ProductDAOImpl();
        try {
            System.out.println(searchKey);
            if (!searchKey.isEmpty()) {
                products = product_dao.getAllProductsByKey(searchKey);
            }
            if(products.size()>0){
                request.setAttribute("products", products);
            }
            request.getRequestDispatcher("/pages/search_product.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(searchProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
