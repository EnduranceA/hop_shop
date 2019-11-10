package services;

import models.Address;
import repositories.AddressRepositoryImpl;

public class AddressService {

    private AddressRepositoryImpl addressRepository;

    public AddressService() {
        this.addressRepository = new AddressRepositoryImpl();
    }


    public void addAddress(Address address) {
        addressRepository.save(address);
    }
}