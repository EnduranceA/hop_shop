package repositories;

import models.Customer;

public interface CustomerRepository extends Repository<Customer> {
    Customer findCustomer(String mail);
}
