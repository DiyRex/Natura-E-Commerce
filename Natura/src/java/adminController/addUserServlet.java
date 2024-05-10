package adminController;

import dao.UserDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;

/**
 *
 * @author Devin
 */
public class addUserServlet extends HttpServlet {


  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {     
        request.getRequestDispatcher("/pages/admin/add_user.jsp").forward(request, response);
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

        User newUser = new User(name, contact, aptNo, street, city, state, zip, email, password);
        UserDAOImpl userDao = new UserDAOImpl();

        try {
            userDao.addUser(newUser);
            response.sendRedirect("/admin/users");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/admin/users/addUser");
        }
    }
}
