package repositories;

import models.Customer;

public interface CustomerRepository extends Repository<Customer> {
    Customer findCustomer(String mail, String password);
    void save(String firstName, String lastName, String patronymic, String pathPhoto, String mail,
              String password, String phoneNumber);
}
