package adminController;

import dao.UserDAO;
import dao.UserDAOImpl;
import models.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Devin
 */
public class adminUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO userDAO = new UserDAOImpl();

        try {
            List<User> allUsers = userDAO.getAllUsers();
            request.setAttribute("users", allUsers);
            HttpSession session = request.getSession();
            if (session != null) {
                Boolean isAdminLogged = (Boolean) session.getAttribute("isAdminLogged");
                if (isAdminLogged != null && isAdminLogged) {
                    request.getRequestDispatcher("/pages/admin/users.jsp").forward(request, response);
                } else {
                    response.sendRedirect("/adminLogin");
                }

            }

        } catch (SQLException e) {
            e.printStackTrace();  // Print stack trace to server console/log
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving users");
        } catch (Exception ex) {
            ex.printStackTrace();  // Print stack trace to server console/log
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unexpected error when loading user data");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
