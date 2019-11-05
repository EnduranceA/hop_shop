package services;

import models.Product;
import repositories.ProductRepositoryImpl;

import java.util.List;

public class ProductService {

    private ProductRepositoryImpl productRepository;

    public ProductService() {
        this.productRepository = new ProductRepositoryImpl();
    }

    public Product findProductById(String id) {
        return productRepository.findProduct(id);
    }


    public List<Product> getByLikePattern(String query) {
        return productRepository.getByLikePattern(query);
    }

    public List<Product> findAllProducts() {
        return productRepository.findAll();
    }

    public List<Product> getProductsByTypes(String format, String color, String size) {
        return productRepository.getProductsByTypes(format, color, size);
    }
}
