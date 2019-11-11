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

@WebServlet("/novelties")
public class NoveltiesServlet extends HttpServlet {

    private ProductService productService;

    @Override
    public void init()  {
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Product> novelties = productService.getNewItems();
            req.setAttribute("novelties", novelties);
            req.getServletContext().getRequestDispatcher("/jsp/novelties.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {

    }
}
