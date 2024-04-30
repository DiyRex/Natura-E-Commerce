package clientController;

import dao.UserDAOImpl;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;

/**
 *
 * @author Devin
 */
public class clientSignupServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/authentication/signup_page.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String aptNo = request.getParameter("apt_no");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Create User object
        User newUser = new User(name, contact, aptNo, street, city, state, zip, email, password);

        // Instance of DAO implementation
        UserDAOImpl userDao = new UserDAOImpl();

        try {
            userDao.addUser(newUser); // Adding user to the database
            response.sendRedirect("/login"); // Redirecting to a success page
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=Unable to register"); // Redirect back to signup on error
        }
    }
}
