package adminController;

import dao.AdminDAOImpl;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Order;
import models.Product;

/**
 *
 * @author Devin
 */
public class adminHomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            AdminDAOImpl admin_dao = new AdminDAOImpl();
            int salesCount = admin_dao.fetchSalesCount();
            int productsCount = admin_dao.fetchProductsCount();
            int usersCount = admin_dao.fetchUsersCount();
            int totalCost = admin_dao.fetchTotalCost();
            List<Product> products = admin_dao.fetchTopSellingProducts();
            List<Order> orders = admin_dao.fetchRecentOrders();
            request.setAttribute("orders", orders);
            request.setAttribute("products", products);
            request.setAttribute("salesCount", salesCount);
            request.setAttribute("productsCount", productsCount);
            request.setAttribute("usersCount", usersCount);
            request.setAttribute("totalCost", totalCost);
            HttpSession session = request.getSession();
            if (session != null) {
                Boolean isAdminLogged = (Boolean) session.getAttribute("isAdminLogged");
                if (isAdminLogged != null && isAdminLogged) {
                    request.getRequestDispatcher("/pages/admin/index.jsp").forward(request, response);
                }else{
                    response.sendRedirect("/adminLogin");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to render the index page.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
