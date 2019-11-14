package servlets;

import models.Comment;
import models.Customer;
import models.Product;
import services.CommentService;
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
import java.util.Map;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    private ProductService productService;
    private CommentService commentService;
    private Product product;

    @Override
    public void init() {
        productService = new ProductService();
        commentService = new CommentService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        int productId = Integer.parseInt(req.getParameter("id"));
        product = productService.findProductBy(productId);
        session.setAttribute("product", product);
        Map<Comment, Customer> comments = commentService.findCommentBy(productId);
        session.setAttribute("comments", comments);
        try {
            req.getServletContext().getRequestDispatcher("/jsp/product.jsp").forward(req,resp);
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        Customer customer = (Customer) session.getAttribute("currentUser");
        List<Product> basket = (List<Product>) session.getAttribute("basket");
        if (basket == null) {
            basket = new ArrayList<>();
        }
        if (customer != null) {
            basket.add(product);
            //добавить продукт в корзину(basket_product)
            productService.addProductToBasket(customer.getId(), product.getId());
        }
        else {
            basket.add(product);
        }
        session.setAttribute("basket", basket);
    }
}
