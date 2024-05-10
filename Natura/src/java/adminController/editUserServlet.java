package adminController;

import dao.UserDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;

/**
 *
 * @author Devin
 */
public class editUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String _id = (String) request.getParameter("id");

        if (_id == null) {
            response.sendRedirect("/admin/users");
        } else {
            int id = Integer.parseInt(_id);

            UserDAOImpl user_dao = new UserDAOImpl();
            try {
                User user = user_dao.getUser(id);
                request.setAttribute("user", user);
                request.getRequestDispatcher("/pages/admin/edit_user.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(editUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt((String) request.getParameter("id"));
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String aptNo = request.getParameter("apt_no");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User updatedUser = new User(id, name, contact, aptNo, street, city, state, zip, email, password);
        UserDAOImpl user_dao = new UserDAOImpl();
        try {
            user_dao.updateUser(updatedUser);
            response.sendRedirect("/admin/users");
        } catch (SQLException ex) {
            Logger.getLogger(editUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("/admin/users/editUser?id=" + id);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String _id = (String) request.getParameter("id");

        if (_id == null) {
            response.sendRedirect("/admin/users");
        } else {
            int id = Integer.parseInt(_id);
            UserDAOImpl user_dao = new UserDAOImpl();
            try {
                user_dao.deleteUser(id);
                response.sendRedirect("/admin/users");
            } catch (SQLException ex) {
                Logger.getLogger(editUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
