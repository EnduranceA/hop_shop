package servlets;

import models.Product;
import org.json.JSONArray;
import org.json.JSONObject;
import services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/catalog")
public class CatalogServlet extends HttpServlet {

    ProductService productService;

    @Override
    public void init() {
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.findAllProducts();
        resp.setContentType("text/html");
        req.setAttribute("allProducts", products);
        req.getServletContext().getRequestDispatcher("/jsp/catalog.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.getProductsByTypes(req.getParameter("format"),
                req.getParameter("color"), req.getParameter("size"));
        JSONArray array = new JSONArray();
        for (Product product: products) {
            array.put(new JSONObject(product));
        }
        JSONObject jo = new JSONObject();
        jo.put("objects", array);
        resp.setContentType("text/json");
        resp.getWriter().write(jo.toString());
    }
}
