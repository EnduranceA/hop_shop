package repositories;

import helpers.ConnectionClass;
import models.Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AddressRepositoryImpl implements AddressRepository {

    private Connection connection;

    public AddressRepositoryImpl() {
        this.connection = ConnectionClass.getConnection();
    }

    //language=SQL
    private String SQL_ADD_ADDRESS = "INSERT INTO address (area, region, locality, street, home_number, apartment) " +
            "VALUES  (?, ?, ?, ?, ?, ?) RETURNING id;";

    //language=SQL
    private String SQL_FIND_ALL = "SELECT * FROM address;";

    //language=SQL
    private String SQL_CHECK_ADDRESS = "SELECT * FROM address WHERE area = ? AND region = ? AND locality = ? AND street = ? " +
            "AND home_number = ? AND apartment = ?;";

    @Override
    public List<Address> findAll() {
        List<Address> addresses = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SQL_FIND_ALL);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                addresses.add(addressRowMapper.mapRow(rs));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
        return addresses;
    }

    public RowMapper<Address> addressRowMapper = row -> {
        try{
            String area = row.getString("area");
            String region = row.getString("region");
            String locality = row.getString("locality");
            String street = row.getString("street");
            Integer homeNumber = row.getInt("home_number");
            Integer apartment = row.getInt("apartment");
            Integer id = row.getInt("id");
            return new Address(id, area, region, locality, street, homeNumber, apartment);
        }catch (SQLException e){
            throw new IllegalArgumentException(e);
        }
    };
    @Override
    public void save(Address address) {
        try {
            PreparedStatement st = connection.prepareStatement(SQL_ADD_ADDRESS);
            st.setString(1, address.getArea());
            st.setString(2, address.getRegion());
            st.setString(3, address.getLocality());
            st.setString(4, address.getStreet());
            st.setInt(5, address.getHomeNumber());
            st.setInt(6, address.getApartment());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                address.setId(rs.getInt("id"));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override
    public boolean isExist(Address address) {
        try {
            PreparedStatement st = connection.prepareStatement(SQL_CHECK_ADDRESS);
            st.setString(1, address.getArea());
            st.setString(2, address.getRegion());
            st.setString(3, address.getLocality());
            st.setString(4, address.getStreet());
            st.setInt(5, address.getHomeNumber());
            st.setInt(6, address.getApartment());
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override
    public void remove(Address address) {

    }


}
