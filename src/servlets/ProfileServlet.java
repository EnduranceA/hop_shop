package servlets;
import models.Customer;
import services.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private CustomerService customerService;
    private Customer customer;

    @Override
    public void init()  {
        customerService = new CustomerService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        customer = (Customer) req.getSession().getAttribute("currentUser");
        try {
            if (customer == null) {
                resp.sendRedirect("/login");
            }
            else {
                req.getServletContext().getRequestDispatcher("/jsp/profile.jsp").forward(req, resp);
            }
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        customer= (Customer) req.getSession().getAttribute("currentUser");
        int id = customer.getId();
        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");
        String patronymic = req.getParameter("patronymic");
        String mail = req.getParameter("mail");
        String numberPhone = req.getParameter("phone");
        customerService.update(id, firstName, lastName, patronymic, mail, numberPhone);
        req.getSession().setAttribute("currentUser", customerService.findCustomerBy(customer.getId()));
        try {
            req.getServletContext().getRequestDispatcher("/jsp/profile.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
