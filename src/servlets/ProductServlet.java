package servlets;

import models.Customer;
import models.Product;
import org.json.JSONObject;
import services.ProductService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("order") != null) {
            req.getServletContext().getRequestDispatcher("/jsp/order.jsp").forward(req, resp);
        }
        else {
            if (req.getParameter("basket") != null) {
                req.getServletContext().getRequestDispatcher("/jsp/basket.jsp").forward(req,resp);
            }
        }
    }
}
