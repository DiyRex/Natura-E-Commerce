package adminController;

import dao.OrderDAOImpl;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Order;

/**
 *
 * @author Devin
 */
public class adminOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            if (session != null) {
                Boolean isAdminLogged = (Boolean) session.getAttribute("isAdminLogged");
                if (isAdminLogged != null && isAdminLogged) {
                    OrderDAOImpl order_dao = new OrderDAOImpl();
                    List<Order> orders = order_dao.fetchAllOrders();
                    request.setAttribute("orders", orders);
                    request.getRequestDispatcher("/pages/admin/orders.jsp").forward(request, response);
                } else {
                    response.sendRedirect("/adminLogin");
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to render the order page.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
