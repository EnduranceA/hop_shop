package repositories;

import helpers.ConnectionClass;
import models.Comment;
import java.sql.*;
import java.util.List;

public class CommentRepositoryImpl implements CommentRepository {

    private Connection connection;

    public CommentRepositoryImpl() {
        this.connection = ConnectionClass.getConnection();
    }

    //language=SQL
    private String SQL_SAVE_COMMENT = "INSERT INTO comment (customer_id, time, text) " +
            "VALUES (?, ?, ?) reurning id;";

    //language=SQL
    private String SQL_FIND_COMMENTS = "SELECT * FROM comment WHERE id = ?;";

    @Override
    public List<Comment> findAll() {
        return null;
    }

    public RowMapper<Comment> commentsRowMapper = row -> {
        try{
            Integer id = row.getInt("id");
            Integer customerId = row.getInt("customer_id");
            Timestamp time = row.getTimestamp("time");
            String text = row.getString("text");
            return new Comment(id, customerId, time, text);
        }catch (SQLException e){
            throw new IllegalArgumentException(e);
        }
    };

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

    public List<Comment> findCommentsBy(int id) {
        List<Comment> comments = null;
        try {
            PreparedStatement st = connection.prepareStatement(SQL_FIND_COMMENTS);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                comments.add(commentsRowMapper.mapRow(rs));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
        return comments;
    }
}
