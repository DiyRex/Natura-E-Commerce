package clientController;

import dao.OrderDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class clientOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            OrderDAOImpl order_dao = new OrderDAOImpl();
            response.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            int userId = Integer.parseInt((String) session.getAttribute("userID"));
            List<Order> orders = order_dao.fetchOrdersByUserId(userId);
            if(userId != 0){
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/pages/my_orders.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("/login").forward(request, response);
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
