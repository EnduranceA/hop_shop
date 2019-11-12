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

@WebServlet("/sale")
public class SaleServlet extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() {
        this.productService = new ProductService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Product> sale = productService.findSale();
            request.setAttribute("sale", sale);
            request.getServletContext().getRequestDispatcher("/jsp/sale.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            throw new IllegalArgumentException(e);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

    }
}
