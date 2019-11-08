package repositories;

import models.Address;

import java.util.List;

public class AddressRepositoryImpl implements AddressRepository {

    //language=SQL
    private String SQL_ADD_ADDRESS = "INSERT INTO address (area, region, locality, street, home_number, apartment) " +
            "VALUES  (?, ?, ?, ?, ?, ?) RETURNING id;";
    @Override
    public List<Address> findAll() {
        return null;
    }

    @Override
    public void save(Address address) {

    }
}
