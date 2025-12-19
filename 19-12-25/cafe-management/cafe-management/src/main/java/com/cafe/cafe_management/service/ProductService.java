package com.cafe.cafe_management.service;

import com.cafe.cafe_management.model.Category;
import com.cafe.cafe_management.model.Product;
import com.cafe.cafe_management.repository.CategoryRepository;
import com.cafe.cafe_management.repository.ProductRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    private final ProductRepository repo;
    private final CategoryRepository categoryRepo;

    public ProductService(ProductRepository repo,
                          CategoryRepository categoryRepo) {
        this.repo = repo;
        this.categoryRepo = categoryRepo;
    }

    public List<Product> getAll() {
        return repo.findAll();
    }

    public Product create(Product p, Long categoryId) {
        Category cat = categoryRepo.findById(categoryId)
                .orElseThrow(() -> new RuntimeException("Category not found"));
        p.setCategory(cat);
        p.setStatus("ACTIVE");
        return repo.save(p);
    }
}
