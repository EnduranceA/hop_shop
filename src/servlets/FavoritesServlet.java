package servlets;

import models.Customer;
import models.Product;
import services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/favorites")
public class FavoritesServlet extends HttpServlet {

    private ProductService productService;
    private Customer customer;

    @Override
    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        try {
            HttpSession session = req.getSession();
            customer = (Customer) session.getAttribute("currentUser");
            if (customer == null) {
                resp.sendRedirect("/login");
            }
            else {
                req.getServletContext().getRequestDispatcher("/jsp/favorites.jsp").forward(req, resp);
            }
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        List<Product> favorites = productService.findFavorites(customer.getId());
        Product product = productService.findProductBy(
                Integer.parseInt(req.getParameter("product_id")));
        favorites.add(product);
        session.setAttribute("favorites", favorites);
    }
}
