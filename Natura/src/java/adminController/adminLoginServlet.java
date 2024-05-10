package adminController;

import dao.AdminDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Admin;

/**
 *
 * @author Devin
 */
public class adminLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/authentication/admin_login_page.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Admin admin = null;
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        AdminDAOImpl admin_dao = new AdminDAOImpl();
        try {
            admin = admin_dao.loginAdmin(email, password);
            if (admin != null) {
                // User is found, add user to session
                HttpSession session = request.getSession();
                session.setAttribute("adminName", admin.getName());
                session.setAttribute("adminEmail", admin.getEmail());
                session.setAttribute("isAdminLogged", true);
                response.sendRedirect("/admin");
            } else {
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("/pages/authentication/admin_login_page.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(adminLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "Invalid email or password");
            response.sendRedirect("/adminlogin");
        }

    }
}
