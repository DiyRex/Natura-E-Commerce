package clientController;

import dao.UserDAO;
import dao.UserDAOImpl;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;

/**
 *
 * @author Devin
 */
public class clientLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/authentication/login_page.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = "Guest";
        String userID = null;
        String cartID = null;
        String addressLine = "";
        
        // Retrieve email and password from the req
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAOImpl();
        
        try {
            
            User user = userDAO.loginUser(email, password);

            if (user != null) {
                // User is found, add user to session
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                

                userName = user.getName();
                userID = String.valueOf(user.getId());
                cartID = String.valueOf(user.getCartId());
                System.out.println("cart id is " + cartID);
                // Build the address string, checking for nulls to avoid "null" in the output
                addressLine = userName + " \n"
                        + (user.getApt_no() != null ? user.getApt_no() : "") + " \n"
                        + (user.getStreet() != null ? user.getStreet() : "") + " \n"
                        + (user.getCity() != null ? user.getCity() : "") + " \n"
                        + (user.getState() != null ? user.getState() : "") + " \n"
                        + (user.getZip_code() != null ? user.getZip_code() : "");
                
                session.setAttribute("userName", userName);
                session.setAttribute("userID", userID);
                session.setAttribute("cartID", cartID);
                session.setAttribute("addressLine", addressLine);

                response.sendRedirect("/"); 
            } else {
                // User not found or invalid login, handle as login failure
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("/login").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log the SQL exception
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database access error occurred.");
        } catch (Exception ex) {
            ex.printStackTrace();  // Log the unexpected exception
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
        }
    }

}
