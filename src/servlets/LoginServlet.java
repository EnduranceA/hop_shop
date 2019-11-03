package servlets;

import models.Customer;
import services.CustomerService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private CustomerService customerService;

    @Override
    public void init() {
        customerService = new CustomerService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        Customer user = (Customer) session.getAttribute("current_user");
        try {
            if (user != null) {
                resp.sendRedirect("/profile");
            }
            else {
                req.getServletContext().getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
            }
        }
        catch (IOException |ServletException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        Customer user = (Customer) session.getAttribute("currentUser");
        try {
            if (user != null) {
                resp.sendRedirect("/profile");
            }
            else {
                Customer customer = customerService.findCustomer(
                        req.getParameter("mail"),
                        req.getParameter("password")
                );
                if (customer != null) {
                    session.setAttribute("currentUser", customer);
                    resp.sendRedirect("/profile");
                }
                else {
                    req.getServletContext().getRequestDispatcher("/login").forward(req, resp);
                }
            }
        } catch (IOException | ServletException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
