package repositories;

import helpers.ConnectionClass;
import models.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingRepositoryImpl implements BookingRepository {

    private Connection connection;

    public BookingRepositoryImpl() {
        this.connection = ConnectionClass.getConnection();
    }

    //language=SQL
    private final String SQL_FIND_ALL = "SELECT *FROM booking;";

    //language=SQL
    private final String SQL_INSERT_BOOKING = "INSERT INTO booking (id_customer, time, amount, id_status, id_address, payment, delivery, info) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?) returning id;";

    public RowMapper<Booking> bookingRowMapper = row -> {
        try{
            Integer id = row.getInt("id");
            Integer idCustomer = row.getInt("id_customer");
            Timestamp time = row.getTimestamp("time");
            Integer amount = row.getInt("amount");
            Integer idStatus = row.getInt("id_status");
            Integer idAddress = row.getInt("id_address");
            String payment = row.getString("payment");
            String delivery = row.getString("delivery");
            String info = row.getString("info");
            return new Booking(id, idCustomer, time, amount, idStatus, idAddress,
                    payment, delivery, info);
        }catch (SQLException e){
            throw new IllegalArgumentException(e);
        }
    };
    @Override
    public List<Booking> findAll() {
        List<Booking> bookings = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SQL_FIND_ALL);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                bookings.add(bookingRowMapper.mapRow(rs));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
        return bookings;
    }

    @Override
    public void save(Booking booking) {
        try {
            PreparedStatement st = connection.prepareStatement(SQL_INSERT_BOOKING);
            st.setInt(1, booking.getIdCustomer());
            st.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            st.setInt(3, booking.getAmount());
            st.setInt(4, booking.getIdStatus());
            st.setInt(5, booking.getIdAddress());
            st.setString(6,booking.getPayment());
            st.setString(7, booking.getDelivery());
            st.setString(8, booking.getInfo());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                booking.setId(rs.getInt("id"));
            }
        } catch (SQLException e) {
            throw new IllegalArgumentException(e);
        }
    }

    @Override
    public boolean isExist(Booking booking) {
        return false;
    }

    @Override
    public void remove(Booking booking) {

    }
}
