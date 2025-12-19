package com.cafe.cafe_management.model;

import jakarta.persistence.*;

@Entity
@Table(name = "order_item")
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer quantity;

    private Double price;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

	public void setOrder(Order order2) {
		// TODO Auto-generated method stub
		
	}

	public void setProduct(Product product2) {
		// TODO Auto-generated method stub
		
	}

	public void setQuantity(Object quantity2) {
		// TODO Auto-generated method stub
		
	}

	public double getPrice() {
		// TODO Auto-generated method stub
		return 0;
	}

    // getters and setters
}