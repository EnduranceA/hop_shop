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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    private ProductService productService;
    private Product product;

    @Override
    public void init() {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        int id = Integer.parseInt(req.getParameter("id"));
        product = productService.findProductBy(id);
        session.setAttribute("product", product);
        try {
            req.getServletContext().getRequestDispatcher("/jsp/product.jsp").forward(req,resp);
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            HttpSession session = req.getSession();
            Customer customer = (Customer) session.getAttribute("currentUser");
            List<Product> basket = (List<Product>) session.getAttribute("basket");
            if (customer != null) {
                basket.add(product);
                //добавить продукт в корзину(basket_product)
            }
            else {
                if (basket == null) {
                    basket = new ArrayList<>();
                }
                basket.add(product);
            }
            req.getServletContext().getRequestDispatcher("/jsp/order.jsp").forward(req,resp);
        } catch (ServletException |IOException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
