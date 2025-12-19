package com.cafe.cafe_management.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cafe.cafe_management.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}