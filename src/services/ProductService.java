package services;

import models.Product;
import repositories.ProductRepositoryImpl;

import java.util.ArrayList;
import java.util.List;

public class ProductService {

    private ProductRepositoryImpl productRepository;

    public ProductService() {
        this.productRepository = new ProductRepositoryImpl();
    }

    public Product findProductBy(int id) {
        return productRepository.findProduct(id);
    }

    public List<Product> getNewItems () {
        return productRepository.findNewItems();
    }

    public List<Product> findAllProducts() {
        return productRepository.findAll();
    }

    public List<Product> getProductsByTypes(String format, String color, String size) {
        return productRepository.getProductsByTypes(format, color, size);
    }

}
