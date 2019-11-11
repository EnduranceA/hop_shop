package services;

import models.Comment;
import models.Customer;
import repositories.CommentRepositoryImpl;
import repositories.CustomerRepositoryImpl;
import repositories.ProductRepositoryImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CommentService {

    private CommentRepositoryImpl commentRepository;
    private CustomerRepositoryImpl customerRepository;

    public CommentService() {
        this.commentRepository = new CommentRepositoryImpl();
        this.customerRepository = new CustomerRepositoryImpl();
    }

    public void add(Comment comment) {
        commentRepository.save(comment);
    }

    public Map<Comment, Customer> findCommentBy(int id) {
        Map<Comment, Customer> map = new HashMap<>();
        List<Comment> comments = commentRepository.findCommentsBy(id);
        for (Comment comment: comments) {
            map.put(comment, customerRepository.findUserBy(comment.getCustomerId()));
        }
        return map;
    }
}
