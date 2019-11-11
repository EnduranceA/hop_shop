package servlets;

import models.Comment;
import models.Customer;
import org.json.JSONArray;
import org.json.JSONObject;
import services.CommentService;
import services.ProductService;

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
        int idCustomer = customer.getId();
        Timestamp time = new Timestamp(System.currentTimeMillis());
        String text = req.getParameter("text");
        Comment comment = new Comment(idCustomer, time, text);
        commentService.add(comment);
        JSONObject jo = new JSONObject();
        jo.put("comments", comment);
        jo.put("user", customer);
        resp.setContentType("text/json");
        try {
            resp.getWriter().write(jo.toString());
        } catch (IOException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
