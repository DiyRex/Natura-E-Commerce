package clientController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Devin
 */
public class checkoutServlet extends HttpServlet {

    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    // Retrieve the 'total' parameter from the request
    String total = request.getParameter("total");
    
    // Optional: Check if the total parameter is present and valid
    if (total == null || total.isEmpty()) {
        // Handle cases where the total parameter is not provided or is empty
        request.setAttribute("error", "Total amount is required.");
        request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        return; // Stop further execution in error case
    }

    // Optionally, you might want to parse and validate the total as a numeric value
    try {
        double totalAmount = Double.parseDouble(total);
        // You can now use totalAmount for any further calculations or validations needed
    } catch (NumberFormatException e) {
        // Handle cases where the total parameter is not a valid number
        request.setAttribute("error", "Invalid total amount provided.");
        request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        return; // Stop further execution in error case
    }
    
    // Set the total amount as an attribute of the request to pass it to the JSP
    request.setAttribute("total", total);
    
    // Forward the request and response objects to 'checkout.jsp'
    request.getRequestDispatcher("/pages/checkout.jsp").forward(request, response);
}


  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
