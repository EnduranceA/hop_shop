package servlets;

import models.Customer;
import models.Product;
import org.springframework.security.core.parameters.P;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/basket")
public class BasketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("currentUser");
            List<Product> basket = (List<Product>) session.getAttribute("basket");
            request.setAttribute("customer", customer);
            request.setAttribute("basket", basket);
            request.getServletContext().getRequestDispatcher("/jsp/basket.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
