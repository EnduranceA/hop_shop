package servlets;

import models.Product;
import services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() {
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        //лист новинок (из 5 элементов)
        List<Product> newItems = productService.getNewItems();
        //лист рекомендаций (из 5 элементов)
        List<Product> recommendations = productService.findAllProducts();
        resp.setContentType("text/html");
        req.setAttribute("newItems", newItems);
        req.setAttribute("recommendations", recommendations);
        try {
            req.getServletContext().getRequestDispatcher("/jsp/home.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {

    }
}
