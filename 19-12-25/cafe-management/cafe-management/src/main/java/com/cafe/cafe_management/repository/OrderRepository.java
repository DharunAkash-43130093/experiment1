package com.cafe.cafe_management.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cafe.cafe_management.model.Order;
import com.cafe.cafe_management.model.User;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findByUser(User user);
}