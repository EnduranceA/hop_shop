package repositories;

import helpers.ConnectionClass;
import models.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {

    //language=SQL
    private String SQL_ADD_PRODUCT = "INSERT INTO product (name, description, price, count, path_photo) " +
            "VALUES (?, ?, ?, ?, ?) RETURNING id";

    //language=SQL
    private String SQL_FIND_ALL = "SELECT * FROM product";

    @Override
    public void save(Product product) {
        try {
            PreparedStatement st = ConnectionClass.getConnection().prepareStatement(SQL_ADD_PRODUCT);
            st.setString(1, product.getName());
            st.setString(2, product.getDescription());
            st.setInt(3, product.getPrice());
            st.setInt(4, product.getCount());
            st.setString(5, product.getPathPhoto());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                product.setId(rs.getInt("id"));
            }
            st.close();
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }

    }

    public RowMapper<Product> productsRowMapper = row -> {
        try{
            Integer id = row.getInt("id");
            String name = row.getString("name");
            String description = row.getString("description");
            Integer price = row.getInt("price");
            Integer count = row.getInt("mail");
            String pathPhoto = row.getString("pathPhoto");
            return new Product(id, name, description, price, count, pathPhoto);
        }catch (SQLException e){
            throw new IllegalArgumentException(e);
        }
    };

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement st = ConnectionClass.getConnection().prepareStatement(SQL_FIND_ALL);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                products.add(productsRowMapper.mapRow(rs));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
        return products;
    }
}
