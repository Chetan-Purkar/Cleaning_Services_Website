package com.Spring.service;

import java.util.List;

import com.Spring.model.Order;
import com.Spring.model.User;

public interface OrderService {
    List<Order> findOrdersByUser(User user);
    void saveOrder(Order order);
    void deleteOrderByIdAndUser(Long orderId, User user);
    List<Order> findOrdersByUserId(Long userId);
    void updateOrderStatus(Long orderId, String status);
    List<Order> findOrdersByStatus(String status);
    List<Order> findAllOrders(); // Add this method declaration
    
    List<Order> findOrdersByUsername(String username);
    List<Order> findOrdersWithUsers();
    
    
	int getOrderCountByDay(int day, int month, int year);
	int getOrderCountByMonth(int month, int year);
	int getOrderCountByYear(int year);
	int getTotalOrderCount(); 
}
