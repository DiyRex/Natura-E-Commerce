package clientController;

import com.google.gson.Gson;
import dao.OrderDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Order;
import models.OrderItem;

/**
 *
 * @author Devin
 */
public class clientOrderServlet extends HttpServlet {
//query
//SELECT o.Order_ID, o.User_ID, o.Shipping_Address, o.Payment, o.Total_Cost, oi.Orditem_ID, oi.Product_ID, oi.Qty, oi.Price FROM orders o JOIN order_items oi ON o.Order_ID = oi.Order_ID WHERE o.Order_ID = 3004;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            OrderDAOImpl order_dao = new OrderDAOImpl();
//            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            // Assuming you pass the user ID as a query parameter
//            int userId = Integer.parseInt(request.getParameter("userId"));
            List<Order> orders = order_dao.fetchOrdersByUserId(101);
//            Gson gson = new Gson();
//            String json = gson.toJson(orders);
//
//            out.print(json);
//            out.flush();
//            out.println("<html><body>");
//            out.println("<h1>Order Details</h1>");
//            if (orders.isEmpty()) {
//                out.println("<p>No orders found.</p>");
//            } else {
//                for (Order order : orders) {
//                    out.println("<p><strong>Order ID:</strong> " + order.getId() + "<br>");
//                    out.println("<strong>User ID:</strong> " + order.getId()+ "<br>");
//                    out.println("<strong>Shipping Address:</strong> " + order.getShipping_Address()+ "<br>");
//                    out.println("<strong>Payment:</strong> " + order.getPayment() + "<br>");
//                    out.println("<strong>Total Cost:</strong> " + order.getTotal_cost()+ "<br>");
//                    out.println("<strong>Order Status:</strong> " + order.getOrder_status()+ "<br>");
//                    out.println("<strong>Order Date:</strong> " + order.getOrderdate()+ "</p>");
//
//                    out.println("<h2>Items:</h2>");
//                    out.println("<ul>");
//                    for (OrderItem item : order.getOrder_item()) {
//                        out.println("<li>" + item.getProduct_name()+ " - Quantity: " + item.getQty()+ ", Price: " + item.getPrice() + "</li>");
//                    }
//                    out.println("</ul>");
//                }
//            }
//            out.println("</body></html>");
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/pages/my_orders.jsp").forward(request, response);

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
