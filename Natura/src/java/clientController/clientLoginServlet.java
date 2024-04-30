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
        // Retrieve email and password from the request
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Create an instance of the DAO to interact with the database
        UserDAO userDAO = new UserDAOImpl();

        try {
            // Attempt to authenticate the user with the provided credentials
            User user = userDAO.loginUser(email, password);

            if (user != null) {
                // User is found, add user to session
                HttpSession session = request.getSession();
                session.setAttribute("user", user);  // Store the user object in the session

                // Redirect to the index page or dashboard
                response.sendRedirect("index.jsp"); // Using redirect to avoid form resubmission issues
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
