package services;

import models.Comment;
import repositories.CommentRepositoryImpl;

public class CommentService {

    private CommentRepositoryImpl commentRepository;

    public CommentService() {
        this.commentRepository = new CommentRepositoryImpl();
    }

    public void add(Comment comment) {
        commentRepository.save(comment);
    }
}
