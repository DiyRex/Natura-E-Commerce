package clientController;

import com.google.gson.Gson;
import dao.CartDAO;
import dao.CartDAOImpl;
import dao.OrderDAOImpl;
import dao.OrderItemDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Cart;
import models.Order;
import models.OrderItem;

/**
 *
 * @author Devin
 */
public class createOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = (String) request.getParameter("user_id");
        CartDAOImpl cartDao = new CartDAOImpl();
        List<Cart> cartItems = null;

        try {
            // Retrieve the cart products for the user
            cartItems = cartDao.getCartProducts(userId);
            if (cartItems != null) {

            }

            // Convert the list of cart items to JSON using Gson
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(cartItems);

            // Set the response type to JSON and send the cart items as a response
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse);

        } catch (Exception e) {
            // Handle exceptions and send an error in JSON format
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"error\":\"Error retrieving cart items: " + e.getMessage() + "\"}");
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String totalCostStr = request.getParameter("totalCost");
        String shippingAddress = request.getParameter("shippingAddress");
        String paymentMethod = request.getParameter("paymentMethod");
        String cartIdStr = request.getParameter("cartId");
        String order_status = "pending";

        int totalCost = 0;
        int cartId = 0;

        try {

            if (totalCostStr != null && !totalCostStr.isEmpty()) {
                double costAsDouble = Double.parseDouble(totalCostStr);
                totalCost = (int) costAsDouble;
            } else {
                System.err.println("Total cost parameter is missing or empty.");
            }

            if (cartIdStr != null && !cartIdStr.isEmpty()) {
                cartId = Integer.parseInt(cartIdStr);
                System.out.println("ok");
            } else {
                System.err.println("Cart ID parameter is missing or empty.");
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid number format detected. Error: " + e.getMessage());
        }

        System.out.println(request.getParameterMap());
        System.out.println(totalCost);
        System.out.println(cartId);
        try {
            System.out.println("Order Details - UserID: " + userId + ", Shipping Address: " + shippingAddress + ", Total Cost: " + totalCost + ", Payment Method: " + paymentMethod + ", Order Status: " + order_status);
            Order order = new Order(
                    Integer.parseInt(userId),
                    shippingAddress,
                    paymentMethod,
                    totalCost,
                    order_status
            );
            OrderDAOImpl order_dao = new OrderDAOImpl();
            int order_id = order_dao.createOrder(order);
            
            List<OrderItem> orderList = new ArrayList<>();
            
            CartDAOImpl cart_dao = new CartDAOImpl();
            List<Cart> cartItems = cart_dao.getCartProducts(userId);
            if (cartItems != null) {
                for (Cart item : cartItems) {
                    orderList.add(new OrderItem(
                            order_id,
                            item.getProduct_id(),
                            item.getQty(),
                            item.getPrice()*item.getQty()
                    ));
                }
            }
            OrderItemDAOImpl orderItem_dao = new OrderItemDAOImpl();
            orderItem_dao.createOrderItems(orderList);
            cart_dao.clearCart(cartId);
   
            
            // Set the response type to JSON and send the cart items as a response
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\":\""+order_id+" added\"}");

        } catch (IOException e) {
            // Handle exceptions and send an error in JSON format
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"error\":\"Error create order: " + e.getMessage() + "\"}");
        } catch (SQLException ex) {
            Logger.getLogger(createOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(createOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
