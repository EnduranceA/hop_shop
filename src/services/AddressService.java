package services;

import models.Address;
import repositories.AddressRepositoryImpl;

public class AddressService {

    private AddressRepositoryImpl addressRepository;

    public AddressService() {
        this.addressRepository = new AddressRepositoryImpl();
    }

    public void add(Address address) {
        if (!addressRepository.isExist(address)) {
            addressRepository.save(address);
        }
    }
}
