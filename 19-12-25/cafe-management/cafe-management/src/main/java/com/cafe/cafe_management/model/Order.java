package com.cafe.cafe_management.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Double totalAmount;

    // PLACED, PREPARING, COMPLETED, CANCELLED
    private String status;

    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private List<OrderItem> items;

	public void setTotalAmount(double total) {
		// TODO Auto-generated method stub
		
	}

	public void setItems(List<OrderItem> items2) {
		// TODO Auto-generated method stub
		
	}

	public void setUser(User user2) {
		// TODO Auto-generated method stub
		
	}

	public void setStatus(String string) {
		// TODO Auto-generated method stub
		
	}

	public void setCreatedAt(LocalDateTime now) {
		// TODO Auto-generated method stub
		
	}

    // getters and setters
}