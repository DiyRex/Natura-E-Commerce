package clientController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Devin
 */
public class clientLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("user", null);
        session.setAttribute("userName", "Guest");
        session.setAttribute("userID", null);
        session.setAttribute("cartID", null);
        session.setAttribute("addressLine", null);
        response.sendRedirect("/login");
    }
}
