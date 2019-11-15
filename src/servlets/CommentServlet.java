package servlets;

import models.Comment;
import models.Customer;
import models.Product;
import org.json.JSONArray;
import org.json.JSONObject;
import services.CommentService;
import services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet {

    private ProductService productService;
    private CommentService commentService;
    private int idProduct;
    private int idCustomer;

    @Override
    public void init() {
        productService = new ProductService();
        commentService = new CommentService();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp){
        HttpSession session = req.getSession();
        Customer customer = (Customer) session.getAttribute("currentUser");
        Product product = (Product) session.getAttribute("product");
        idCustomer = customer.getId();
        idProduct = product.getId();
        Timestamp time = new Timestamp(System.currentTimeMillis());
        String text = req.getParameter("text");
        Comment comment = new Comment(idCustomer, idProduct, time, text);
        commentService.add(comment);

        JSONArray array = new JSONArray();
        array.put(new JSONObject(comment)); array.put(new JSONObject(customer));

        JSONObject o = new JSONObject();
        o.put("objects", array);
        resp.setContentType("text/json");
        try {
            resp.getWriter().write(o.toString());
        } catch (IOException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
