package repositories;

import helpers.ConnectionClass;
import models.Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class CommentRepositoryImpl implements CommentRepository {

    private Connection connection;

    public CommentRepositoryImpl() {
        this.connection = ConnectionClass.getConnection();
    }

    //language=SQL
    private String SQL_SAVE_COMMENT = "INSERT INTO comment (customer_id, time, text) " +
            "VALUES (?, ?, ?) reurning id;";
    @Override
    public List<Comment> findAll() {
        return null;
    }

    @Override
    public void save(Comment comment) {
        try {
            PreparedStatement st = connection.prepareStatement(SQL_SAVE_COMMENT);
            st.setInt(1, comment.getCustomerId());
            st.setTimestamp(2, comment.getTime());
            st.setString(3, comment.getText());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                comment.setId(rs.getInt("id"));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
