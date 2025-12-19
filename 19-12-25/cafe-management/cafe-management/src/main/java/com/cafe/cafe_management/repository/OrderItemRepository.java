package com.cafe.cafe_management.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cafe.cafe_management.model.OrderItem;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
}