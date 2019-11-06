package servlets;

import models.Customer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import services.CustomerService;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@MultipartConfig
@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {

    private CustomerService customerService;
    private PasswordEncoder encoder;

    @Override
    public void init() {
        this.customerService = new CustomerService();
        encoder = new BCryptPasswordEncoder();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getServletContext().getRequestDispatcher("/jsp/registration.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            HttpSession session = req.getSession();
            Customer user = (Customer) session.getAttribute("currentUser");
            if (user != null) {
                resp.sendRedirect("/profile");
            }
            else {
                String password = req.getParameter("password");
                ServletContext context = getServletContext();
                customerService.addNewCustomer(context,
                        req.getParameter("first_name"),
                        req.getParameter("last_name"),
                        req.getParameter("patronymic"),
                        req.getPart("path_photo"),
                        req.getParameter("mail"),
                        encoder.encode(password),
                        req.getParameter("phone_number"));
                session.setAttribute("currentUser", user);
                resp.sendRedirect("/profile");
            }
        }
        catch (IOException | ServletException e) {
            throw new IllegalArgumentException(e);
        }

    }
}

