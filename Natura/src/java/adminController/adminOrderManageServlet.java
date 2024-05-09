/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package adminController;

import dao.OrderDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Order;

/**
 *
 * @author Devin
 */
public class adminOrderManageServlet extends HttpServlet {


  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       OrderDAOImpl order_dao = new OrderDAOImpl();
       int id = Integer.parseInt((String)request.getParameter("id"));
       String method = (String)request.getParameter("method");
        System.out.println("id: "+id);
        System.out.println("method: "+method);
        try {
            System.out.println("Inside");
            if(method.equals("delete")){
                order_dao.deleteOrder(id);
            }else if(method.equals("complete")){
                order_dao.updateOrderStatus(id);
            }
        } catch (Exception ex) {
            Logger.getLogger(adminOrderManageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
       response.sendRedirect("/admin/orders");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }
}
