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
        List<Product> products = new ArrayList<>();
        List<Product> newItems = productRepository.findNewItems();
        for (int i = 0; i < 5; i++) {
            products.add(newItems.get(i));
        }
        return products;
    }

    public List<Product> findAllProducts() {
        return productRepository.findAll();
    }

    public List<Product> getProductsByTypes(String format, String color, String size) {
        return productRepository.getProductsByTypes(format, color, size);
    }

    public List<Product> findRecommedations() {
        List<Product> recommendations = new ArrayList<>();
        List<Product> products = findAllProducts();
        for (int i = 0; i < 5; i++) {
            recommendations.add(products.get(i));
        }
        return recommendations;
    }
}
