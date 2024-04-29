/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package adminController;

import adminController.dao.ProductDAO;
import adminController.dao.ProductDAOImpl;
import adminController.models.Product;
import java.io.IOException;
import javax.servlet.http.Part;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Devin
 */
@MultipartConfig
public class addProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/admin/add_product.jsp");
        dispatcher.include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve form data
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String qtyStr = request.getParameter("qty");

        // Debug output to the console
        System.out.println("Title: " + title + ", Description: " + description + ", Price: " + priceStr + ", Quantity: " + qtyStr);
        String filename = "";
        try {
            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(qtyStr);
            Product product = new Product(title, description, price, quantity);

            

            // Utilize the DAO to save the product
            ProductDAO productDAO = new ProductDAOImpl();
            int productId = productDAO.addProduct(product);

            // Redirect to a success page or another relevant page
            response.sendRedirect("/pages/admin/products.jsp");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid input format for price or quantity: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private String getFileName(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8"); // Handle possible character encoding issues
//
//        // Fetch product details from the request
//        String title = request.getParameter("title");
//        String description = request.getParameter("description");
//        double price = 0;
//        int quantity = 0;
//
//        try {
//            price = Double.parseDouble(request.getParameter("price"));
//            quantity = Integer.parseInt(request.getParameter("qty"));
//        } catch (NumberFormatException e) {
//            // Log error or handle format exception
//            e.printStackTrace();
//            request.setAttribute("errorMessage", "Invalid input format for price or quantity.");
//            request.getRequestDispatcher("error.jsp").forward(request, response);
//            return;
//        }
//
//        // Create a Product object from the fetched data
//        Product product = new Product(title, description, price, quantity);
//
//        // Handle file upload
//        Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
//        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//        // Create a unique file name
//        String newFileName = System.currentTimeMillis() + "_" + fileName;
//        String filePath = "images/products/" + newFileName;
//
//        // Saves the file to the filesystem
//        filePart.write(getServletContext().getRealPath("/") + filePath);
//
//        // Utilize the DAO to save the product
//        ProductDAO productDAO = new ProductDAOImpl();
//        try {
//            // Insert product and retrieve generated product ID
//            int productId = productDAO.addProduct(product);
//
//            // Insert image record in the database
//            productDAO.addProductImage(productId, filePath);
//
//            // Redirect to a success page or another relevant page
//            response.sendRedirect("/pages/admin/products.jsp");
//        } catch (Exception e) {
//            e.printStackTrace();
//            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
//            request.getRequestDispatcher("error.jsp").forward(request, response);
//        }
//    }

