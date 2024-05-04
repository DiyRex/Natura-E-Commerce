/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package clientController;

import dao.CartDAOImpl;
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
import models.Cart;

/**
 *
 * @author Devin
 */

public class cartUpdateServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userID");

    
    CartDAOImpl cartDao = new CartDAOImpl();
    List<Cart> cartItems = null;

    try {
        cartItems = cartDao.getCartProducts(userId);
        session.setAttribute("cartItems", cartItems); // Optional: store in session for other uses
    } catch (Exception e) {
        
    }

    // Calculate total cost
    int totalCost = 0;
    if (cartItems != null) {
        for (Cart item : cartItems) {
            totalCost += item.getPrice() * item.getQty();
        }
    }
    }
    
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String userId = request.getParameter("userId");
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantityChange = Integer.parseInt(request.getParameter("quantityChange"));
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        System.out.println(productId);
        System.out.println(quantityChange);
        System.out.println(cartId);
        System.out.println(userId);
        CartDAOImpl cartDao = new CartDAOImpl();
        try {
            cartDao.addOrUpdate(productId, cartId, quantityChange);
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"success\"}");
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\":\"error\",\"message\":\"" + e.getMessage() + "\"}");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemID = Integer.parseInt(request.getParameter("itemID"));
        CartDAOImpl cartDao = new CartDAOImpl();
        try {
            cartDao.deleteItem(itemID);
            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"success\"}");
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"status\":\"error\",\"message\":\"" + e.getMessage() + "\"}");
        } catch (Exception ex) {
            Logger.getLogger(cartUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            int quantityChange = Integer.parseInt(request.getParameter("quantityChange"));

            CartDAOImpl cartDao = new CartDAOImpl();
            cartDao.addOrUpdate(productId, cartId, quantityChange);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"status\":\"success\"}");
        } catch (NumberFormatException | NullPointerException ex) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"status\":\"error\",\"message\":\"Invalid input parameters\"}");
        } catch (Exception ex) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"status\":\"error\",\"message\":\"" + ex.getMessage() + "\"}");
        }
    }

}
