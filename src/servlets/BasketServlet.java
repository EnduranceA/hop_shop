package servlets;

import models.Customer;
import models.Product;
import org.springframework.security.core.parameters.P;
import services.ProductService;

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

    private ProductService productService;
    private Customer customer;
    private List<Product> basket;

    @Override
    public void init()  {
        productService = new ProductService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            customer = (Customer) session.getAttribute("currentUser");
            basket = (List<Product>) session.getAttribute("basket");
            request.setAttribute("customer", customer);
            request.setAttribute("basket", basket);
            request.getServletContext().getRequestDispatcher("/jsp/basket.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
        int productId =  Integer.parseInt(request.getParameter("id"));

        if (customer != null) {
            productService.delete(productId, customer.getId());
        }

        for (int i = 0; i < basket.size(); i++) {
            if (basket.get(i).getId() == productId) {
                basket.remove(i);
                break;
            }
        }
    }
}
