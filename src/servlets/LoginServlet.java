package servlets;

import models.Customer;
import models.Product;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import services.CustomerService;
import services.ProductService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private CustomerService customerService;
    private ProductService productService;
    private PasswordEncoder encoder;

    @Override
    public void init() {
        productService = new ProductService();
        customerService = new CustomerService();
        encoder =  new BCryptPasswordEncoder();
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
        List<Product> basket;
        Customer user = (Customer) session.getAttribute("currentUser");
        try {
            if (user != null) {
                resp.sendRedirect("/profile");
            }
            else {
                Customer customer = customerService.findCustomerBy(req.getParameter("mail"));
                if (encoder.matches(req.getParameter("password"), customer.getPassword())) {
                    session.setAttribute("currentUser", customer);
                    basket = productService.findBasket(customer.getId());
                    session.setAttribute("basket", basket);
                    resp.sendRedirect("/profile");
                }
                else {
                    basket = new ArrayList<>();
                    session.setAttribute("basket", basket);
                    req.getServletContext().getRequestDispatcher("/jsp/login.jsp").forward(req, resp);
                }
            }
        } catch (IOException | ServletException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
