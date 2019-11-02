package repositories;

import models.Product;

public interface ProductRepository extends Repository<Product> {
    void save(Product product);
}
