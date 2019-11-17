package servlets;

import models.Customer;
import models.Product;
import repositories.ProductRepository;
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


@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        Customer customer = (Customer) session.getAttribute("currentUser");
        int id = Integer.parseInt(req. getParameter("product_id"));
        Product product = productService.findProductBy(id);
        List<Product> basket = (List<Product>) session.getAttribute("basket");
        if (basket == null) {
            basket = new ArrayList<>();
        }
        if (customer != null) {
            basket.add(product);
            productService.addProductToBasket(customer.getId(), product.getId());
        }
        else {
            basket.add(product);
        }
        session.setAttribute("basket", basket);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {

    }
}
