package repositories;

import helpers.ConnectionClass;
import models.Customer;
import models.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CustomerRepositoryImpl implements CustomerRepository {

    private Connection connection;

    public CustomerRepositoryImpl() {
        this.connection = ConnectionClass.getConnection();
    }

    //language=SQL
    private String SQL_INSERT_CUSTOMER = "INSERT INTO customer (first_name, last_name, patronymic, mail, password, phone_number, path_photo) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?) RETURNING id";

    //language=SQL
    private String SQL_SELECT_ALL = "SELECT * FROM customer";

    //language=SQL
    private String SQL_FIND_CUSTOMER = "SELECT * FROM customer WHERE mail = ?;";

    //language=SQL
    private String SQL_FIND_USER_BY_ID = "SELECT * FROM customer WHERE id = ?;";

    //language=SQL
    private String SQL_CHANGE_ROW = "UPDATE customer SET path_photo = ? AND first_name = ? " +
            "AND last_name = ? AND last_name = ? AND patronymic = ? AND phone_number = ? " +
            "AND password = ? WHERE id = ?;";

    public RowMapper<Customer> userRowMapper = row -> {
        try{
            Integer id = row.getInt("id");
            String firstName = row.getString("first_name");
            String lastName = row.getString("last_name");
            String patronymic = row.getString("patronymic");
            String mail = row.getString("mail");
            String password = row.getString("password");
            String phoneNumber = row.getString("phone_number");
            String path_photo = row.getString("path_photo");
            return new Customer(id, firstName, lastName, patronymic, mail,
                    password, phoneNumber, path_photo);
        }catch (SQLException e){
            throw new IllegalArgumentException(e);
        }
    };

    @Override
    public Customer findCustomer(String mail) {
        Customer customer = null;
        try {
            PreparedStatement st = connection.prepareStatement(SQL_FIND_CUSTOMER);
            st.setString(1, mail);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                customer = userRowMapper.mapRow(rs);
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
        return customer;
    }

    @Override
    public void save(Customer customer) {
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement(SQL_INSERT_CUSTOMER);
            st.setString(1, customer.getFirstName());
            st.setString(2, customer.getLastName());
            st.setString(3, customer.getPatronymic());
            st.setString(4, customer.getMail());
            st.setString(5, customer.getPassword());
            st.setString(6, customer.getPhoneNumber());
            st.setString(7, customer.getPathPhoto());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                customer.setId(rs.getInt("id"));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }

    }

    @Override
    public boolean isExist(Customer customer) {
        return false;
    }


    @Override
    public List<Customer> findAll() {
        List<Customer> customers = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SQL_SELECT_ALL);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                customers.add(userRowMapper.mapRow(rs));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
        return customers;
    }

    public Customer findUserBy(int id) {
        Customer customer = null;
        try {
            PreparedStatement st = connection.prepareStatement(SQL_FIND_USER_BY_ID);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                customer = userRowMapper.mapRow(rs);
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
        return customer;
    }

    public void changeRow(Customer customer, Map<String, String> map) {
        try {
            PreparedStatement st = connection.prepareStatement(SQL_CHANGE_ROW);
            st.setString(1, map.get("path_photo"));
            st.setString(2, map.get("first_name"));
            st.setString(3, map.get("last_name"));
            st.setString(4, map.get("patronymic"));
            st.setString(5, map.get("number_phone"));
            st.setString(6, map.get("password"));
            st.executeUpdate();
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
