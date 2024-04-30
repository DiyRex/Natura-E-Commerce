package UrlFilters;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
/**
 *
 * @author Devin
 */
@WebFilter("/pages/admin/index.jsp")
public class adminHomeFilter implements Filter {
     @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code can be placed here
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Checking the full URI is optional, as the filter mapping should suffice
        String uri = httpRequest.getRequestURI();
        if (uri.endsWith("/pages/admin/index.jsp") || uri.endsWith("/pages/admin/")) {
            httpResponse.sendRedirect("/admin");
            return;
        }

        // Pass the request along the filter chain
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup code can be placed here
    }
}
