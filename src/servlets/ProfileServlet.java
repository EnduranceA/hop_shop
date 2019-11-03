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

    @Override
    public void init()  {
        customerService = new CustomerService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        Customer user = (Customer) req.getSession().getAttribute("currentUser");
        try {
            if (user == null) {
                resp.sendRedirect("/login");
            }
            else {
                req.setAttribute("user", user);
                req.getServletContext().getRequestDispatcher("/jsp/profile.jsp").forward(req, resp);
            }
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        Customer customer= (Customer) req.getSession().getAttribute("currentUser");
        Map<String, String> map = new HashMap<>();
        map.put("path_photo", req.getParameter("path_photo"));
        map.put("first_name", req.getParameter("first_name"));
        map.put("last_name", req.getParameter("last_name"));
        map.put("patronymic", req.getParameter("patronymic"));
        map.put("number_phone", req.getParameter("number_phone"));
        map.put("password", req.getParameter("password"));
        customerService.update(customer, map);
        try {
            req.getServletContext().getRequestDispatcher("/jsp/profile.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
