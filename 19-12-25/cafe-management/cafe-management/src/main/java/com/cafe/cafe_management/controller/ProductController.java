package com.cafe.cafe_management.controller;

import com.cafe.cafe_management.model.Product;
import com.cafe.cafe_management.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public ResponseEntity<List<Product>> getAll() {
        return ResponseEntity.ok(productService.getAll());
    }

    @PostMapping("/admin/create")
    public ResponseEntity<Product> create(
            @RequestBody Product product,
            @RequestParam Long categoryId) {
        return ResponseEntity.ok(productService.create(product, categoryId));
    }
}