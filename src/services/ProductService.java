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
    public List<Product> findBasket(int id) {
        return productRepository.findBasket(id);
    }

    public List<Product> getNovelties() {
        List<Product> newItems = new ArrayList<>();
        List<Product> products = getNewItems();
        for (int i = 0; i < 5; i++) {
            newItems.add(products.get(i));
        }
        return newItems;
    }

    public List<Product> findRecommendation() {
        List<Product> products = new ArrayList<>();
        List<Product> recommendations = findAllProducts();
        for (int i = 0; i < 5; i++) {
            products.add(recommendations.get(i));
        }
        return products;
    }

    public List<Product> findSale() {
        return productRepository.findProductOfSale();
    }
}
