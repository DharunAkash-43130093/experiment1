package com.cafe.cafe_management.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cafe.cafe_management.model.Category;
import com.cafe.cafe_management.model.Product;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {

    List<Product> findByCategory(Category category);
}