package com.example.demomvc.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false); // Get current session without creating a new one
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null); // Check if user is logged in

        String loginURI = httpRequest.getContextPath() + "/login"; // Define login URL

        // Allow access to login page and other public resources
        if (isLoggedIn || httpRequest.getRequestURI().equals(loginURI) ||
                httpRequest.getRequestURI().startsWith("/public/")) { // Allow access to public resources
            chain.doFilter(request, response); // User is logged in, continue with the request
        } else {
            // Redirect to login page
            httpResponse.sendRedirect(loginURI);
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}
