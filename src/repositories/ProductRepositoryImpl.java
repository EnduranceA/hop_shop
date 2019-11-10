package repositories;

import helpers.ConnectionClass;
import models.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {

    Connection connection;

    public ProductRepositoryImpl() {
        this.connection = ConnectionClass.getConnection();
    }

    //language=SQL
    private String SQL_ADD_PRODUCT = "INSERT INTO product (name, description, price, count, path_photo, time, size, color, format) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?) RETURNING id;";

    //language=SQL
    private String SQL_FIND_ALL = "SELECT * FROM product;";

    //language=SQL
    private String SQL_FIND_PRODUCT_BY_ID = "SELECT * FROM product WHERE id = ?;";

    //private=SQL
    private String SQL_FIND_NEW_ITEMS = "SELECT * FROM product where time > CURRENT_TIMESTAMP - interval '100 hours';";

    //language=SQL
    private String SQL_FIND_PRODUCTS_BY_TYPES = "SELECT * FROM product WHERE format = ? AND color = ? AND size = ?;";

    //language=SQL
    private String SQL_FIND_BASKET = "SELECT * FROM product WHERE (SELECT * basket WHERE id_custome = ?);";

    @Override
    public void save(Product product) {
        try {
            PreparedStatement st = connection.prepareStatement(SQL_ADD_PRODUCT);
            st.setString(1, product.getName());
            st.setString(2, product.getDescription());
            st.setInt(3, product.getPrice());
            st.setInt(4, product.getCount());
            st.setString(5, product.getPathPhoto());
            st.setString(6, product.getSize());
            st.setString(7, product.getColor());
            st.setString(8, product.getFormat());
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
            Integer count = row.getInt("count");
            String pathPhoto = row.getString("path_photo");
            String time = row.getString("time");
            String size = row.getString("size");
            String color = row.getString("color");
            String format = row.getString("format");
            return new Product(id, name, description, price, count, pathPhoto,
                    time, size, color, format);
        }catch (SQLException e){
            throw new IllegalArgumentException(e);
        }
    };

    public Product findProduct(int id) {
        Product product = null;
        try {
            PreparedStatement st = connection.prepareStatement(SQL_FIND_PRODUCT_BY_ID);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                product = productsRowMapper.mapRow(rs);
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
        return product;
    }

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SQL_FIND_ALL);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                products.add(productsRowMapper.mapRow(rs));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
        return products;
    }


    public List<Product> getProductsByTypes(String format,
                                            String color, String size) {
        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SQL_FIND_PRODUCTS_BY_TYPES);
            st.setString(1, format);
            st.setString(2, color);
            st.setString(3, size);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                products.add(productsRowMapper.mapRow(rs));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
        return products;
    }

    public List<Product> findNewItems() {
        List<Product> newItems = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SQL_FIND_NEW_ITEMS);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                newItems.add(productsRowMapper.mapRow(rs));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
        return newItems;
    }
    public List<Product> findBasket(int id) {
        List<Product> basket = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SQL_FIND_BASKET);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                basket.add(productsRowMapper.mapRow(rs));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
        return basket;
    }

}
