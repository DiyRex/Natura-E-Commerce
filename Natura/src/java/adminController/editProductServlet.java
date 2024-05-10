package adminController;

import dao.ProductDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Product;

/**
 *
 * @author Devin
 */
public class editProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id == null) {
            response.sendRedirect("/admin/products");
        } else {
            int _id = Integer.parseInt(id);
            ProductDAOImpl product_dao = new ProductDAOImpl();
            try {
                Product product = product_dao.getProduct(_id);
                request.setAttribute("product", product);
                request.getRequestDispatcher("/pages/admin/edit_product.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(editProductServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        double Dprice = Double.parseDouble(request.getParameter("price"));
        int price = (int) Dprice;
        int qty = Integer.parseInt(request.getParameter("qty"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Product product = new Product(id, title, description, price, qty);
        ProductDAOImpl product_dao = new ProductDAOImpl();
        try {
            product_dao.updateProduct(product);
            response.sendRedirect("/admin/products");
        } catch (SQLException ex) {
            Logger.getLogger(editProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String _id = (String) request.getParameter("id");

        if (_id == null) {
            response.sendRedirect("/admin/products");
        } else {
            int id = Integer.parseInt(_id);
            ProductDAOImpl product_dao = new ProductDAOImpl();
            try {
                product_dao.deleteProduct(id);
                response.sendRedirect("/admin/products");
            } catch (SQLException ex) {
                Logger.getLogger(editUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
